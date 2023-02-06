import 'package:flutter/material.dart';
import 'package:digital_mag/vues/ecrans_export.dart';
import 'package:digital_mag/vues/routes/article_categorie_route.dart';

import '../vues/routes/discover_route.dart';
import '../vues/routes/home_route.dart';



class NavBAr extends StatelessWidget {
  const NavBAr({Key? key, required this.index}) : super(key: key);
final int index ;
  @override
  Widget build(BuildContext context){


    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(icon: Container(
          margin: const EdgeInsets.only(left: 50),
          child: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, HomeRoute.routeName);
            },
            icon: const Icon(Icons.home),
          ),
        ),label: 'Home')
        ,
        BottomNavigationBarItem(icon: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, DiscoverRoute.routeName);
          },
          icon: const Icon(Icons.search),
        ),label: 'Recherche'),
        BottomNavigationBarItem(icon: Container(
          margin: const EdgeInsets.only(right: 50),
          child: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, ArticleCategorieVue.routeName);
            },
            icon: const Icon(Icons.person),
          ),
        ),label: 'Profile')
      ],
    );
  }



}
