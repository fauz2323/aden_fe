import 'package:aden_fe/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../widget/vertical_card_widget.dart';

class FoodMenuView extends StatelessWidget {
  const FoodMenuView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                    VerticalCardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
