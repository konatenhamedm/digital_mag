import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:digital_mag/modeles/categore_modele.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/widgets/config.dart';

class ApiService{
  static var client = http.Client();
  
  static Future<List<CategorieModele>?> fetchCategories() async {
    var response = await client.get(Uri.parse(Config.apiUrl.toString()+Config.categorieUrl.toString()));
    if(response.statusCode == 200){
      var jsonString = response.body;
      return categorieFromJson(jsonString);
    }else{
      return null;
    }


  }
  static Future<List<NewsModele>?> fetchPosts(
      int categoryId,
      int pageNumber,
      ) async {
    var url =Config.apiUrl.toString() + Config.postUrl.toString()+categoryId.toString() + "&page_no=" + pageNumber.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }


    }

  static Future<List<NewsModele>?> fetchArticleParCategorie(int categoryId) async {
    var url =Config.apiUrl.toString() + Config.postUrl.toString()+categoryId.toString()+categoryId.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }


  }
  static Future<List<NewsModele>?> fetchPosts2(int pageNumber) async {
    var url =Config.apiUrl.toString() + Config.postUrl2.toString() + "&page_no=" + pageNumber.toString();
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }else{
      return null;
    }

    }


    static Future<NewsModele?> fetchDetails(int postId) async{
      var url =Config.apiUrl.toString() + Config.postDetailUrl + postId.toString();
      var response = await client.get(Uri.parse(url));

      if(response.statusCode == 200){
        var jsonString = response.body;
        return postDetailsFrom(jsonString);
      }else{
        return null;
      }


    }




  }