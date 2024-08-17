import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/di/injection.dart';
import 'package:aden_fe/module/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/size_helper.dart';
import '../../../../core/theme/text_theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';
import 'cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (value) async {
              await TokenHelper().setToken(value);
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => loaded(context),
            loaded: (value) => loaded(context),
            loading: () => LoadingWidget(),
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
                      "Hello new users",
                      style: TextThemes.h2,
                    ),
                    Text(
                      "Register to your account to continue",
                      style: TextThemes.h5.merge(TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormWidget(
                      controller: _nameController,
                      hintText: "Your name...",
                      isSecure: false,
                    ),
                    TextFormWidget(
                      controller: _emailController,
                      hintText: "Your email...",
                      isSecure: false,
                    ),
                    TextFormWidget(
                      controller: _phoneController,
                      hintText: "Your phone...",
                      isSecure: false,
                    ),
                    TextFormWidget(
                      controller: _passwordController,
                      hintText: "Your Password...",
                      isSecure: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonWidget(
                      height: 45,
                      width: SizeHelper.getWidth(context) * 0.9,
                      text: "Register",
                      onTap: () async {
                        final message =
                            await context.read<RegisterCubit>().register(
                                  _emailController.text,
                                  _passwordController.text,
                                  _nameController.text,
                                  _phoneController.text,
                                );

                        //snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Login"),
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
