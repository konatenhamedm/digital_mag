import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<NewsModele> postFromJson(String str)=>
    List<NewsModele>.from(
  json.decode(str).map(
        (x)=>NewsModele.fromJson(x),
  ),
);


NewsModele fromJsonToDetail(String str) => NewsModele.fromJson(json.decode(str));


class NewsModele {
  int? id;
  String? title;
  String? imageUrl;
  bool? imageUrlBool;
  String? postedDate;
  int? categoryId;
  String? categoryName;
  String? postContent;
  String? auteur;
  String? url;


  NewsModele( {
    this.id,
    this.title,
    this.imageUrl,
    this.imageUrlBool,
    this.postedDate,
    this.categoryId,
    this.categoryName,
    this.postContent,
    this.auteur,
    this.url,
  });

  factory NewsModele.fromJson1(Map<String, dynamic> addjson){

    return NewsModele(
        id: addjson["id"],
        title:  addjson["title"],
        imageUrl: addjson["image_url"],
        categoryName: addjson['category_name'],
        auteur : addjson['auteur'],
        url : addjson['link'],
        postedDate : DateFormat("dd-MMM-yyyy").format(
        DateTime.parse(
            addjson['post_date']
        )
    ),
    categoryId : addjson['category_id'],
   // if(addjson['post_content'] != null){
      postContent : addjson['post_content']
   // }
    );
  }

  NewsModele.fromJson(Map<String,dynamic> json){
    id= json['id'];
    title= json['title'];
    auteur= json['auteur'];
    url= json['link'];
    if(json['image_url'] == false ) {
      imageUrlBool = json['image_url'];
    }
    else {
      imageUrl = json['image_url'];
    }

    postedDate= DateFormat("dd-MMM-yyyy").format(
      DateTime.parse(
        json['post_date']
      )
    );
    categoryId = json['category_id'];
    categoryName= json['category_name'];
    if(json['post_content'] != null){
      postContent = json['post_content'];
    }

  }
}