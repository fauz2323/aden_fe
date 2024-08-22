import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class VerticalCardWidget extends StatelessWidget {
  const VerticalCardWidget({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/aden-ab505.appspot.com/o/" +
                        image +
                        "?alt=media",
                height: SizeHelper.getWidth(context) * 0.4,
                width: SizeHelper.getWidth(context) * 0.4,
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
