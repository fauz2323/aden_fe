import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/presentation/view/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => loaded(context),
            loaded: (token) => loaded(context),
          );
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (token) {},
          );
        },
      ),
    );
  }

  Widget loaded(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg-login.jpg',
          height: SizeHelper.getHeight(context) * 0.5,
          width: SizeHelper.getWidth(context),
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeHelper.getHeight(context) * 0.35,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 35, left: 30, right: 30, bottom: 35),
                width: SizeHelper.getWidth(context),
                height: SizeHelper.getHeight(context) -
                    SizeHelper.getHeight(context) * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextThemes.h2,
                    ),
                    Text(
                      "Login to your account to continue",
                      style: TextThemes.h5.merge(TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormWidget(
                      controller: _emailController,
                      hintText: "Your email...",
                      isSecure: false,
                    ),
                    TextFormWidget(
                      controller: _passwordController,
                      hintText: "Your Password...",
                      isSecure: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot your password?"),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ButtonWidget(
                      height: 45,
                      width: SizeHelper.getWidth(context) * 0.9,
                      text: "Login",
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          child: Text("Register"),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
