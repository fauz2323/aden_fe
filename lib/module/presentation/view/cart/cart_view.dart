import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/module/domain/entities/user_cart_entities.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/helper/size_helper.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../di/injection.dart';
import '../../widget/button_widget.dart';
import '../../widget/cart_card_widget.dart';
import 'cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
          style: TextThemes.h4,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorized: () async {
              await TokenHelper().deleteAllToken();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            payment: () => Navigator.pushNamed(context, '/payment'),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loaded: (userCart, total) => _loaded(context, userCart, total),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, UserCartEntities data, int total) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: SizeHelper.getWidth(context) * 0.9,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery to home",
                      style:
                          TextThemes.h4.merge(TextStyle(color: Colors.white)),
                    ),
                    Text(
                      'Jl. Cempaka No. 1',
                      style: TextThemes.p.merge(
                        TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                Iconify(
                  Mdi.chevron_right,
                  size: 45,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your Order",
            style: TextThemes.h4,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
              itemCount: data.items.length,
              itemBuilder: (context, index) => CartCardWidget(
                image: data.items[index].image,
                name: data.items[index].name,
                price: (data.items[index].price).toInt(),
                quantity: data.items[index].quantity,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total : Rp. " + total.toString(),
            style: TextThemes.h4,
          ),
          SizedBox(
            height: 20,
          ),
          ButtonWidget(
            text: "Checkout",
            width: SizeHelper.getWidth(context) * 0.9,
            height: 50,
            onTap: () async {
              final message = await context.read<CartCubit>().makeOrder();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
