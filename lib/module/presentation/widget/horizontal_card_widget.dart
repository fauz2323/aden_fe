import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class HorizontalCardWidget extends StatelessWidget {
  const HorizontalCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Nasi Goreng",
            style: TextThemes.spanBold,
          ),
          Text(
            "Rp. 15.000",
            style: TextThemes.spanBold.merge(
              TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
