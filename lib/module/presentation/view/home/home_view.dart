import 'package:aden_fe/core/helper/size_helper.dart';
import 'package:aden_fe/module/presentation/view/cart/cart_view.dart';
import 'package:aden_fe/module/presentation/view/food_menu/food_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../home_screen/home_screen_view.dart';
import '../profile/profile_view.dart';
import 'cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static final List<Widget> _widgetOptionsUser = <Widget>[
    const HomeScreenView(),
    const FoodMenuView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Placeholder(),
              initial: (index) => _widgetOptionsUser.elementAt(index),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Text("Some Error"),
              initial: (index) => ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: NavigationBar(
                      height: SizeHelper.getHeight(context) * 0.07,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysHide,
                      destinations: const [
                        NavigationDestination(
                            icon: Icon(Icons.home),
                            label: 'Home',
                            selectedIcon: Icon(
                              Icons.home,
                              color: Colors.green,
                            )),
                        NavigationDestination(
                            icon: Iconify(Mdi.food),
                            label: 'Profile',
                            selectedIcon: Iconify(
                              Mdi.food,
                              color: Colors.green,
                            )),
                        NavigationDestination(
                          icon: Iconify(Mdi.cart),
                          label: 'Order List',
                          selectedIcon: Iconify(
                            Mdi.cart_outline,
                            color: Colors.green,
                          ),
                        ),
                        NavigationDestination(
                            icon: Icon(
                              Icons.person,
                            ),
                            label: 'Profile',
                            selectedIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            )),
                      ],
                      selectedIndex: index,
                      indicatorColor: Colors.transparent,
                      backgroundColor: Colors.white,
                      onDestinationSelected: (index) {
                        context.read<HomeCubit>().setSelected(index);
                      },
                    ),
                  ));
        },
      ),
    );
  }

  Widget _page(BuildContext context) {
    return Container();
  }
}
