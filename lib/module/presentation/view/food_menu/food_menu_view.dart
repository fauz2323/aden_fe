import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/core/theme/text_theme.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injection.dart';
import '../../widget/loading_widget.dart';
import '../../widget/vertical_card_widget.dart';
import 'cubit/food_menu_cubit.dart';

class FoodMenuView extends StatelessWidget {
  const FoodMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FoodMenuCubit>()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return BlocConsumer<FoodMenuCubit, FoodMenuState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          unauthorized: () async {
            await TokenHelper().deleteAllToken();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          loaded: (food) => loaded(context, food),
          loading: () => LoadingWidget(),
        );
      },
    );
  }

  Widget loaded(BuildContext context, ListFoodEntities food) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Food',
                style: TextThemes.p.merge(
                  TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "Special for you",
                style: TextThemes.h5.merge(
                  TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1 / 1.3,
                  children: food.listFood
                      .map(
                        (e) => VerticalCardWidget(
                          title: e.name,
                          price: e.price,
                          image: e.image,
                          uuid: e.uuid,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
