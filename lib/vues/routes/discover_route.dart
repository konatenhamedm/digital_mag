import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:digital_mag/vues/discover_ecran.dart';

import '../menu_page.dart';


class DiscoverRoute extends StatefulWidget {
  const DiscoverRoute({Key? key}) : super(key: key);
  static const routeName="/discover";

  @override
  State<DiscoverRoute> createState() => _DiscoverRouteState();
}

class _DiscoverRouteState extends State<DiscoverRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.purpleAccent,
        body:ZoomDrawer(
          mainScreen: DiscoverVue(),
          menuScreen: MenuPage(),
        )
    );

  }
}
