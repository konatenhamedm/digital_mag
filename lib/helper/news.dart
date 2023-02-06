import 'dart:convert';

import 'package:digital_mag/modeles/article.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:http/http.dart' as http;
class News{
  List<Article> articles = [];
  List<NewsModele> articlesm = [];

  Future<void> getArticle() async{
    String url = "https://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=bdcff96120874c2e8299b8a87bd02c83";
    var response = await http.get(Uri.parse(url)) ;
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null || element['author'] != null ||  element['description'] !=null ||  element['content'] !=null ){
          Article article = Article(
            id: element['id'],
            titre: element['title'],
            auteur: element['author'],
            imageUrl: element['urlToImage'],
            desc: element['description'],
            url: element['url'],
            content: element['content'],
            //datePublication: element['publishedAt']
          );

          articles.add(article);
        }
      });
    }
  }

  /*Future<void> getArticleModele() async{
    String url = "https://www.dyzashop.com/refont/wp-json/wp/v2/latest-posts/?category_id=48";
    var response = await http.get(Uri.parse(url)) ;
    var jsonData = jsonDecode(response.body);
    //if(jsonData['status']=="ok"){
    jsonData.forEach((json){
      if(json['image_url'] != null  ){
        NewsModele article = NewsModele(

            title= json['title'];
            if(json['image_url'] != null){
          imageUrl= json['image_url'];
        }

        postedDate= DateFormat("dd-MMM-yyyy").format(
            DateTime.parse(
                json['post_date']
            )
        );
        categoryName= json['category_name'];
        if(json['post_content'] != null){
          postContent = json['post_content'];
        }
        );

        articlesm.add(article);
      }
      });
    // }
  }*/
}