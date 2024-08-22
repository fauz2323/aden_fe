import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/presentation/widget/button_widget.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/helper/token_helper.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../di/injection.dart';
import 'cubit/food_detail_cubit.dart';

class FoodDetailView extends StatelessWidget {
  const FoodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final uuid = ModalRoute.of(context)!.settings.arguments;
    print(uuid);

    return BlocProvider(
      create: (context) => getIt<FoodDetailCubit>()..initial(uuid),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<FoodDetailCubit, FoodDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorized: () async {
              await TokenHelper().deleteAllToken();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => LoadingWidget(),
            loaded: (data, quantity, total) =>
                loaded(context, data, quantity, total),
          );
        },
      ),
    );
  }

  Widget loaded(
      BuildContext context, FoodEntities data, int quantity, int total) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/aden-ab505.appspot.com/o/" +
                            data.image +
                            "?alt=media",
                    height: SizeHelper.getHeight(context) * 0.3,
                    width: SizeHelper.getWidth(context) * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data.name,
                  style: TextThemes.h3.merge(
                    TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  data.category,
                  style: TextThemes.spanBold.merge(
                    TextStyle(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Rp. " + data.price.toString(),
                  style: TextThemes.h4.merge(TextStyle(
                    color: Colors.green,
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Description',
                  style: TextThemes.spanBold,
                ),
                Text(data.description)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total : Rp. " + total.toString(),
                style: TextThemes.h4.merge(TextStyle(color: Colors.green)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                width: SizeHelper.getWidth(context) * 0.25,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<FoodDetailCubit>().decrementQuantity(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Iconify(
                          Mdi.minus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(quantity.toString()),
                    GestureDetector(
                      onTap: () =>
                          context.read<FoodDetailCubit>().incrementQuantity(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Iconify(
                          Mdi.plus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: ButtonWidget(
              text: "Add To Cart",
              height: 44,
              width: SizeHelper.getWidth(context) * 0.9,
              onTap: () async {
                final result = await context.read<FoodDetailCubit>().addCart();

                //snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
