import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class MenuCatWidget extends StatelessWidget {
  const MenuCatWidget({
    super.key,
    required this.title,
    required this.url,
    required this.onTap,
  });
  final String title;
  final String url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: SizeHelper.getWidth(context) * 0.3,
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextThemes.h5.merge(TextStyle(color: Colors.green)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
