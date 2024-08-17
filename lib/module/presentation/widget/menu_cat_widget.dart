import 'package:flutter/material.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class MenuCatWidget extends StatelessWidget {
  const MenuCatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            image: DecorationImage(
              image: Image.asset('assets/images/cat.png').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: SizeHelper.getWidth(context) * 0.3,
          child: Text(
            "Minuman Soda",
            overflow: TextOverflow.ellipsis,
            style: TextThemes.h5.merge(TextStyle(color: Colors.green)),
          ),
        )
      ],
    );
  }
}
