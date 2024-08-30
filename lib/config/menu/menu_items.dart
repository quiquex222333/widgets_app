import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: "Buttons", subTitle: "Some flutter buttons", link: "/buttons", icon: Icons.smart_button_outlined),
  MenuItem(title: "Cards", subTitle: "An styled container", link: "/cards", icon: Icons.credit_card_outlined),
  MenuItem(title: "Progress Inicators", subTitle: "General and Controlled", link: "/progress", icon: Icons.refresh_rounded),
  MenuItem(title: "Snackbars and Dialogs", subTitle: "Screen Indicators", link: "/snackbars", icon: Icons.info_outline),
  MenuItem(title: "Animated Container", subTitle: "Statefull Widget Animated", link: "/animated", icon: Icons.check_box_outline_blank_rounded),
  MenuItem(title: "UI Controls and Tiles", subTitle: "UI Controls Screen", link: "/ui-controls", icon: Icons.car_rental_rounded),
  MenuItem(title: "App Tutorial", subTitle: "Application tutorial, first steps", link: "/tutorial", icon: Icons.accessibility_new_rounded),
  MenuItem(title: "Infinite Scroll and Pull", subTitle: "Infinite Lists, and Pull to refresh", link: "/infinite", icon: Icons.list_alt_rounded),
  
];
