import 'package:digital_mag/vues/articles_par_categorie.dart';
import 'package:digital_mag/vues/details_page..dart';
import 'package:digital_mag/vues/slide.dart';
import 'package:digital_mag/vues/text.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/vues/article_categorie_vue.dart';
import 'package:digital_mag/vues/article_vue.dart';
import 'package:digital_mag/vues/decouvre.dart';
import 'package:digital_mag/vues/love_article.dart';
import 'package:digital_mag/vues/routes/article_categorie_route.dart';
import 'package:digital_mag/vues/routes/discover_route.dart';
import 'package:digital_mag/vues/routes/home_route.dart';
import 'package:digital_mag/vues/splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        HomeRoute.routeName: (context)=> const HomeRoute(),
        ArticleCategorieVue.routeName: (context)=> const ArticleCategorieVue(),
        ArticleVues.routeName: (context)=> const ArticleVues(),
        DetailsPage.routeName: (context)=> const DetailsPage(),
       //Texte.routeName: (context)=>  Texte(isReload: true,),
        DiscoverRoute.routeName: (context)=> const DiscoverRoute(),
        Splash.routeName: (context)=> const Splash(),

      },
      //home: const Menu(),
    );
  }
}

