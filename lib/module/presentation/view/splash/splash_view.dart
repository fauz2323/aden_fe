import 'package:aden_fe/module/presentation/view/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/size_helper.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: Builder(
        builder: (context) => _buildView(context),
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (value) {
              return value
                  ? Navigator.pushReplacementNamed(context, '/home')
                  : Navigator.pushReplacementNamed(context, '/login');
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loaded: (value) => loaded(context),
            initial: () => loaded(context),
          );
        },
      ),
    );
  }

  Widget loaded(BuildContext context) {
    return Container(
      width: SizeHelper.getWidth(context),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            'assets/images/rimbun.jpg',
            width: 200,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
