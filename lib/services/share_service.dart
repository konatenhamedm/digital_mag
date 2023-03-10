import 'dart:convert';

import 'package:digital_mag/modeles/login_modele.dart';
import 'package:digital_mag/vues/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../vues/home.dart';

class ShareService{
  static Future<bool> islLogin() async{
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString("login_detail") != null ? true : false;

  }

  static Future<LoginResponseModel?> loginDetails() async{
    final prefs = await SharedPreferences.getInstance();
   return prefs.getString("login_detail") != null
        ? LoginResponseModel.fromJson(
      jsonDecode(
        prefs.getString("login_detail").toString(),
      ),
    ):null;
  }

  static Future<void> setLoginDetails (LoginResponseModel ? responseModel) async{
   final prefs = await SharedPreferences.getInstance();
   //prefs.setString("login_detail", "konatehamed@gmail.com");
     prefs.getString("login_detail") == null ? prefs.setString("login_detail", jsonEncode(responseModel?.toJson())) : null ;

   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(token));*/

  }

  static Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    //await setLoginDetails(null);
    prefs.remove("login_detail");
    prefs.clear();
    Get.to(const Splash());
    /*Navigator.of(context).push(MaterialPageRoute(
      builder:(context)=> const Splash(),
    ));*/
  }
}