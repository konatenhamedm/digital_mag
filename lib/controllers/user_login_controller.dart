
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/services/api_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginController extends GetxController{
  var isLoading= true.obs;
  var isTrue = false.obs;
  var details = [].obs;

  @override
  void onInit() {

    verification();
    detailsUser();
    super.onInit();
  }

   Future<void> verification() async{
    final prefs = await SharedPreferences.getInstance();
   WidgetsFlutterBinding.ensureInitialized();
   // _result = await ShareService.islLogin();
     prefs.getString("login_detail") != null ? isTrue(true) : isTrue(false);

  }

  Future<void> detailsUser() async{

    final prefs = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    // _result = await ShareService.islLogin();
    if(prefs.getString("login_detail") != null){
      details.add(prefs.getString("login_detail"));
    }else{
      isTrue(false);
    }
   // prefs.getString("login_detail") != null ? details.add(prefs.getString("login_detail")) : isTrue(false);


  }

}