import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/core/theme/text_theme.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/domain/entities/list_category_entities.dart';
import 'package:aden_fe/module/domain/entities/list_food_entities.dart';
import 'package:aden_fe/module/presentation/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:aden_fe/module/presentation/widget/button_widget.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/helper/size_helper.dart';
import '../../widget/horizontal_card_widget.dart';
import '../../widget/menu_cat_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenCubit>()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorized: () async {
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
            loaded: (foodData, catData) => loaded(context, catData, foodData),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget loaded(BuildContext context, ListCategoryEntities categoryEntities,
      ListFoodEntities food) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextThemes.h4,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                          style: TextThemes.h4
                              .merge(TextStyle(color: Colors.white)),
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
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green.withOpacity(0.4),
                  image: DecorationImage(
                    image: Image.asset('assets/images/banner.jpg').image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shop now in apps",
                          style: TextThemes.h3,
                        ),
                        Text(
                          "Get 10% off on your order",
                          style: TextThemes.h5,
                        ),
                        SizedBox(height: 10),
                        ButtonWidget(
                          height: 32,
                          width: SizeHelper.getWidth(context) * 0.3,
                          text: "Order Now",
                          onTap: () {},
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/makanan.png',
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Category Foods", style: TextThemes.h3),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categoryEntities.listCategoryEntities
                      .map(
                        (e) => MenuCatWidget(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/food-menu',
                            arguments: e.name,
                          ),
                          title: e.name,
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/aden-ab505.appspot.com/o/" +
                                  e.icon +
                                  "?alt=media",
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Random For You", style: TextThemes.h3),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: SizeHelper.getHeight(context) * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: (food.listFood..shuffle())
                      .take(5)
                      .map(
                        (e) => HorizontalCardWidget(
                          title: e.name,
                          price: e.price,
                          image: e.image,
                          uuid: e.uuid,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
