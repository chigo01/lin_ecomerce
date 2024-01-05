import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lon_stores/src/config/routes/app_router.gr.dart';
import 'package:lon_stores/src/core/widgets/app_bottom_bar.dart';

@RoutePage()
class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items(int selectedIndex) => [
          buildNavItem(
            icon: 'assets/images/icons/bottom_nav/home.png',
            label: 'Home',
            index: 0,
            activeIcon: 'assets/images/icons/bottom_nav/home_act.png',
            selectedIndex: selectedIndex,
          ),
          buildNavItem(
            icon: 'assets/images/icons/bottom_nav/orders.png',
            label: 'Carts',
            index: 1,
            activeIcon: 'assets/images/icons/bottom_nav/orders-act.png',
            selectedIndex: selectedIndex,
          ),
          buildNavItem(
            icon: 'assets/images/icons/bottom_nav/user.png',
            label: 'User',
            index: 2,
            activeIcon: 'assets/images/icons/bottom_nav/user_act.png',
            selectedIndex: selectedIndex,
          ),
        ];
    // return BottomNavItems([]);
    return Scaffold(
      body: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          CartRoute(),
          UserRoute(),
        ],
        bottomNavigationBuilder: (context, tabRouter) {
          final int selectedIndex = tabRouter.activeIndex;
          return bottomNavigationBar(
            context: context,
            items: items(selectedIndex),
            currentIndex: selectedIndex,
            onTap: tabRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}
