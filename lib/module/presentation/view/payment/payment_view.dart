import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/domain/entities/get_order_Detail_entities.dart';
import 'package:aden_fe/module/presentation/argument/payment_argument.dart';
import 'package:aden_fe/module/presentation/view/payment/cubit/payment_cubit.dart';
import 'package:aden_fe/module/presentation/widget/button_widget.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_theme.dart';

class PaymenView extends StatelessWidget {
  PaymenView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentArgument args =
        ModalRoute.of(context)!.settings.arguments as PaymentArgument;
    print(args.id);
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>()..initial(args.id.toString()),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment"),
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => LoadingWidget(),
            loaded: (data) => _loaded(context, data),
            initial: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, GetOrderDetailEntities data) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "https://media.perkakasku.id/image/qrperkakasku.jpeg",
            width: SizeHelper.getWidth(context) * 0.9,
            height: SizeHelper.getHeight(context) * 0.6,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Please Payment with QRIS",
              style: TextThemes.h4,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Amount : Rp. " + data.total.toString()),
          Text("Note : Please Pay with QRIS with amount of " +
              data.total.toString() +
              ", then click on button below"),
          Spacer(),
          ButtonWidget(
            text: "Make Payment",
            height: 45,
            width: SizeHelper.getWidth(context) * 0.9,
            onTap: () async {
              String message = await context.read<PaymentCubit>().makePayment();

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
