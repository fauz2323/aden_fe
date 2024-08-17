import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class HorizontalCardWidget extends StatelessWidget {
  const HorizontalCardWidget({
    super.key,
    required this.title,
    required this.uuid,
    required this.image,
    required this.price,
  });

  final String title;
  final String uuid;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/food-detail', arguments: uuid);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/makanan-1.jpeg',
                height: SizeHelper.getHeight(context) * 0.22,
                width: SizeHelper.getWidth(context) * 0.35,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextThemes.spanBold,
            ),
            Text(
              "Rp. " + price.toString(),
              style: TextThemes.spanBold.merge(
                TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
