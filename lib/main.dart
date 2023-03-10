import 'package:digital_mag/services/share_service.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/vues/article_categorie_vue.dart';
import 'package:digital_mag/vues/article_vue.dart';
import 'package:digital_mag/vues/routes/discover_route.dart';
import 'package:digital_mag/vues/routes/home_route.dart';
import 'package:digital_mag/vues/splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  var _result = await ShareService.islLogin();
 /* NewModele _result = await ShareService.loginDetails();*/

  /*if(_result){
    _defaultHome = Home(isReload: true, totalRecords: 200);
  }*/
  print("=============uuuuuuu==========${_result}");
  runApp(const MyApp());
}

class NewModele {
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

          primaryColor: Colors.redAccent,
      ),
      initialRoute: '/',
      routes: {
        HomeRoute.routeName: (context)=> const HomeRoute(),
        ArticleCategorieVue.routeName: (context)=> const ArticleCategorieVue(),
        ArticleVues.routeName: (context)=> const ArticleVues(),
        DiscoverRoute.routeName: (context)=> const DiscoverRoute(),
        Splash.routeName: (context)=> const Splash(),

      },
     // home:  const Home(isReload: true, totalRecords: 78),
    );
  }
}

