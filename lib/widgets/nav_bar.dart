import 'package:flutter/material.dart';
import 'package:digital_mag/vues/decouvre.dart';
import 'package:digital_mag/vues/ecrans_export.dart';
import 'package:digital_mag/vues/routes/article_categorie_route.dart';
import 'package:digital_mag/vues/routes/discover_route.dart';
import 'package:digital_mag/vues/routes/home_route.dart';
import 'package:digital_mag/vues/userProfile.dart';

import '../vues/home.dart';
import '../vues/love_article.dart';

class NavBar extends StatelessWidget {

  const NavBar({Key? key, required this.index}) : super(key: key);
  final int index ;
  @override
  Widget build(BuildContext context){


    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Container(
          margin: const EdgeInsets.only(left: 50),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder:(context)=> const Home(isReload: true,totalRecords: 20,),
              ));
              //Navigator.pushNamed(context, Home());
            },
            icon: const Icon(Icons.home,color: Colors.white,),
          ),
        ),label: 'Home')
        ,
        BottomNavigationBarItem(icon: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder:(context)=> const LoveArticle(),
            ));
           // Navigator.pushNamed(context, DiscoverRoute.routeName);
          },
          icon: const Icon(Icons.search,color: Colors.white,),
        ),label: 'Recherche'),
        BottomNavigationBarItem(icon: Container(
          margin: const EdgeInsets.only(right: 50),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder:(context)=> const UserProfile(nom: "konate",urlImage: "assets/images/img.jpg",),
              ));
             // Navigator.pushNamed(context, ArticleCategorieVue.routeName);
            },
            icon: const Icon(Icons.person,color: Colors.white,),
          ),
        ),label: 'Profile')
      ],
    );
  }



}
