import 'package:aden_fe/core/theme/text_theme.dart';
import 'package:aden_fe/module/presentation/widget/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/helper/size_helper.dart';
import '../../widget/horizontal_card_widget.dart';
import '../../widget/menu_cat_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    MenuCatWidget(),
                    MenuCatWidget(),
                    MenuCatWidget(),
                    MenuCatWidget(),
                    MenuCatWidget(),
                    MenuCatWidget(),
                  ],
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
                  children: [
                    HorizontalCardWidget(),
                    HorizontalCardWidget(),
                    HorizontalCardWidget(),
                    HorizontalCardWidget(),
                    HorizontalCardWidget(),
                    HorizontalCardWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
