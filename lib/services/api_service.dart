import 'dart:convert';

import 'package:digital_mag/modeles/login_modele.dart';
import 'package:digital_mag/modeles/notification_modele.dart';
import 'package:digital_mag/services/share_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:digital_mag/modeles/categore_modele.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/widgets/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService{
  static var client = http.Client();

  postData(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({
        "username":"leon",
        "password":"admin123456_"
      });
      var response = await dio.post("https://digital-mag.ci/wp-json/add/v1/restUserLogins", data: formData);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static Future<LoginResponseModel?> inscription(String username,String password,String email) async{

    Map<String ,String> header = {
      'content-type':"multipart/form-data"
    };

    var req =  await (http.MultipartRequest("POST",
        Uri.parse(Config.api.toString() + Config.inscription.toString())
    ));

    req.headers.addAll(header);
    req.fields.addAll({
      "username":username,
      "password":password,
      "email":email,

    });

    var response = await req.send();

    Map body = jsonDecode(await response.stream.bytesToString());
    print(body.toString());

    if(body['statutCode'] == 200){

      LoginResponseModel responseModel = loginResponseModelFromJson(body as Map<String, dynamic>);

      return responseModel;
    }else{
      LoginResponseModel responseModel = loginResponseModelFromJsonVide(body as Map<String, dynamic>);
      return responseModel;
    }
  }

  static Future<LoginResponseModel?> login(String username,String password) async{

    Map<String ,String> header = {
      'content-type':"multipart/form-data"
    };

    var req =  await (http.MultipartRequest("POST",
        Uri.parse(Config.api.toString() + Config.login.toString())
    ));

    req.headers.addAll(header);
    req.fields.addAll({
      "username":username,
      "password":password
    });

    var response = await req.send();

    Map body = jsonDecode(await response.stream.bytesToString());

    if(body['statutCode'] == 200){

      LoginResponseModel responseModel = loginResponseModelFromJson(body as Map<String, dynamic>);

      if(responseModel.statutCode == 200){
        ShareService.setLoginDetails(responseModel);
      }

      return responseModel;
    }else{
      LoginResponseModel responseModel = loginResponseModelFromJsonVide(body as Map<String, dynamic>);
      return responseModel;
    }


  }
  
  static Future<List<CategorieModele>?> fetchCategories() async {
    var response = await client.get(Uri.parse(Config.apiUrl.toString()+Config.categorieUrl.toString()));
    if(response.statusCode == 200){
      var jsonString = response.body;
      return categorieFromJson(jsonString);
    }else{
      return null;
    }


  }

  static Future<List<NewsModele>?> listeArticleFavoris(int userId) async {
    var response = await client.get(Uri.parse(Config.apiUrl.toString()+userId.toString()));
   /* var tableau = [];
    for(response1 as el){
      dynamic response = await client.get(Uri.parse(Config.apiUrl.toString()+el.toString()));
      tableau.add(response);
    }*/

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }
  }
  static Future<List<NewsModele>?> fetchPosts(
      int categoryId,
      int pageNumber,
      ) async {
    var url ="${Config.apiUrl}${Config.postUrl}$categoryId&page_no=$pageNumber";
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }


    }

  static Future<List<NewsModele>?> fetchArticleParCategorie(int categoryId) async {
    var url =Config.apiUrl.toString() + Config.postUrl.toString()+categoryId.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }
  }

  static Future<List<NewsModele>?> fetchPosts2(int pageNumber) async {
    var url =Config.apiUrl.toString() + Config.postUrl.toString() + "&page_no=" + pageNumber.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }
  }



    static Future<List<NewsModele>?> fetchCaroussel() async {
      var url =Config.apiUrl.toString() + Config.postUrlCaroussel.toString();
      var response = await client.get(Uri.parse(url));

      if(response.statusCode == 200){
        var jsonString = response.body;
        return postFromJson(jsonString);
      }else{
        return null;
      }

    }



  static Future<List<NewsModele>?> fetchArticlerecents() async {
    var url =Config.apiUrl.toString() + Config.postUrlRecents.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      // tableau de id des post
      // ensuite j'envoi ça 

      return postFromJson(jsonString);
    }else{
      return null;
    }

  }

  static Future<List<NotificationModele>?> fetchNotification() async {
    var url =Config.apiUrl.toString() + Config.postUrlRecents.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      // tableau de id des post
      // ensuite j'envoi ça

      return notoificationFromJson(jsonString);
    }else{
      return null;
    }

  }


    static Future<NewsModele?> fetchDetails(int postId) async{
    //var postId = 9422;
      var url =Config.apiUrl.toString() + Config.postDetailUrl + postId.toString();
      var response = await client.get(Uri.parse(url));

      if(response.statusCode == 200){
        var jsonString = response.body ;
        //print(fromJsonToDetail(jsonString));
        print("98888888888888888888888888888888888 ${jsonString}");
        return fromJsonToDetail(jsonString);


      }
        return null;


    }

  static Future<NewsModele> fetchInfo(int postId) async{
    var url =Config.apiUrl.toString() + Config.postDetailUrl + postId.toString();
    var response = await client.get(Uri.parse(url));
    final jsonresponse = json.decode(response.body);

    return NewsModele.fromJson(jsonresponse[0]);
  }




  }