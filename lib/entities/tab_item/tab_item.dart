import 'package:flutter/material.dart';

class TabItem {
  final Widget page;
  TabItem({
    required this.page,
  });
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}
