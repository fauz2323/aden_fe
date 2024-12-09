import 'package:aden_fe/core/helper/convert_helper.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/domain/entities/get_all_order_entities.dart';
import 'package:aden_fe/module/presentation/view/my_order/cubit/my_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/token_helper.dart';
import '../../widget/loading_widget.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyOrderCubit>()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: BlocConsumer<MyOrderCubit, MyOrderState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorize: () async {
              await TokenHelper().deleteAllToken();
              if (!context.mounted) return;
              Navigator.pushReplacementNamed(context, '/login');
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(
              child: Center(
                child: Text("error......"), //LoadingWidget(),
              ),
            ),
            loaded: (data) => loaded(context, data),
            loading: () => Container(
              color: Colors.white,
              child: LoadingWidget(),
            ),
          );
        },
      ),
    );
  }

  Widget loaded(BuildContext context, List<GetAllOrderEntities> data) {
    return ListView(
      children: data
          .map(
            (e) => Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Report'),
                      Text('Status: ${e.status}'),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date: ${ConvertHelper.convertDate(e.date)}'),
                      Text('${ConvertHelper.convertPrice(e.price)}'),
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
