import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/domain/entities/profile_entities.dart';
import 'package:aden_fe/module/presentation/view/profile/cubit/profile_cubit.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/theme/text_theme.dart';
import '../../widget/menu_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          loading: () => const LoadingWidget(),
          loaded: (data) => loaded(context, data),
          error: (message) => ErrorWidget(message),
        );
      },
    ));
  }
}

Widget loaded(BuildContext context, ProfileEntities data) {
  return SafeArea(
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
              data.name,
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
                data.email,
                style: TextThemes.h5.merge(
                  TextStyle(color: Colors.green),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MenuProfileWidget(
              icon: Iconify(Mdi.cart),
              title: "My Orders",
              onTap: () {
                Navigator.pushNamed(context, '/my-order');
              },
            ),
            MenuProfileWidget(
              icon: Iconify(Mdi.log_out),
              title: "Log Out",
              onTap: () async {
                await TokenHelper().deleteAllToken();

                if (!context.mounted) return;
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    ),
  );
}
