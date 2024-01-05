import 'package:flutter/material.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';

BottomNavigationBarItem buildNavItem({
  required String icon,
  required String label,
  required int index,
  required String activeIcon,
  required int selectedIndex,
}) {
  final bool isActive = selectedIndex == index;
  return BottomNavigationBarItem(
    icon: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryColor : null,
      ),
      child: Image.asset(
        isActive ? activeIcon : icon,
        width: 24,
        height: 24,
      ),
    ),
    label: label,
  );
}

BottomNavigationBar bottomNavigationBar({
  required BuildContext context,
  required List<BottomNavigationBarItem> items,
  required int currentIndex,
  required void Function(int)? onTap,
}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    items: items,
    currentIndex: currentIndex,
    selectedItemColor: Theme.of(context).primaryColor,
    onTap: onTap,
    selectedIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    selectedLabelStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14.5,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: const TextStyle(
      color: Color(0xFF6D6D6D),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    unselectedItemColor: Colors.grey,
  );
}
