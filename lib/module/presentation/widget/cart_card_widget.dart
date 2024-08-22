import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class CartCardWidget extends StatelessWidget {
  const CartCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
  });
  final String image;
  final String name;
  final int quantity;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/aden-ab505.appspot.com/o/" +
                    image +
                    "?alt=media",
            width: SizeHelper.getWidth(context) * 0.22,
            height: SizeHelper.getWidth(context) * 0.22,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: SizeHelper.getWidth(context) * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style:
                    TextThemes.h5.merge(TextStyle(fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    width: SizeHelper.getWidth(context) * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(quantity.toString()),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Rp. " + price.toString(),
                    style: TextThemes.h5.merge(TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
