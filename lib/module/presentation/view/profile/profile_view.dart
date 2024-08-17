import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/theme/text_theme.dart';
import '../../widget/menu_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    'assets/images/profile.png',
                    height: SizeHelper.getWidth(context) * 0.4,
                    width: SizeHelper.getWidth(context) * 0.4,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Denny Sumargo",
                  style: TextThemes.h4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "X9bZx@example.com",
                    style: TextThemes.h5.merge(
                      TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MenuProfileWidget(
                  icon: Iconify(Mdi.account),
                  title: "My Profile",
                  onTap: () {},
                ),
                MenuProfileWidget(
                  icon: Iconify(Mdi.cart),
                  title: "My Orders",
                  onTap: () {},
                ),
                MenuProfileWidget(
                  icon: Iconify(Mdi.log_out),
                  title: "Log Out",
                  onTap: () async {
                    await TokenHelper().deleteAllToken();

                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
