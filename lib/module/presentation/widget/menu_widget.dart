import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../core/helper/size_helper.dart';
import '../../../core/theme/text_theme.dart';

class MenuProfileWidget extends StatelessWidget {
  const MenuProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      width: SizeHelper.getWidth(context) * 0.9,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style:
                    TextThemes.h5.merge(TextStyle(fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              Iconify(Mdi.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
