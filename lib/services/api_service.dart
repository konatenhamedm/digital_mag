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
      return postFromJson(jsonString);
    }else{
      return null;
    }

  }



    static Future<NewsModele?> fetchDetails(int postId) async{
      var url =Config.apiUrl.toString() + Config.postDetailUrl + postId.toString();
      var response = await client.get(Uri.parse(url));

      if(response.statusCode == 200){
        var jsonString = response.body ;
        //print(fromJsonToDetail(jsonString));
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