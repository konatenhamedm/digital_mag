import 'dart:io';
import 'package:digital_mag/vues/home_logout.dart';
import 'package:digital_mag/vues/slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../services/share_service.dart';
import 'home.dart';
import 'home_vue.dart';
import 'menu_drawer.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const routeName="/";
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 10),() async{
      await GetStorage.init();
      WidgetsFlutterBinding.ensureInitialized();
      var _result = await ShareService.islLogin();
      if(_result){
        Get.to(Home(isReload: true, totalRecords: 15));
      }else{
        Get.to(HomeLogout(isReload: true, totalRecords: 15));
      }

      //Get.to(MenuDrawer());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/spl.png',
              height: 130,
            ),
            const SizedBox(height: 30,),
              if(Platform.isIOS)
               const CupertinoActivityIndicator(
                radius: 20,
              )
            else
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
