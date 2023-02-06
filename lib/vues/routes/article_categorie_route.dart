import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../article_categorie_vue.dart';
import '../menu_page.dart';


class ArticleCategorieRoute extends StatefulWidget {
  const ArticleCategorieRoute({Key? key}) : super(key: key);
  //static const routeName="/article-categorie";

  @override
  State<ArticleCategorieRoute> createState() => _ArticleCategorieRouteState();
}

class _ArticleCategorieRouteState extends State<ArticleCategorieRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.purpleAccent,
        body:ZoomDrawer(
          mainScreen: ArticleCategorieVue(),
          menuScreen: MenuPage(),
        )
    );

  }
}
