import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<NewsModele> postFromJson(String str)=>
    List<NewsModele>.from(
  json.decode(str).map(
        (x)=>NewsModele.fromJson(x),
  ),
);


NewsModele postDetailsFrom(String str) => NewsModele.fromJson(json.decode((str)));

class NewsModele {
  int? id;
  String? title;
  dynamic? imageUrl;
  bool? imageUrlBool;
  String? postedDate;
  int? categoryId;
  String? categoryName;
  String? postContent;
  String? auteur;
  String? url;


  NewsModele(param0,  {
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
  NewsModele.fromJson(Map<String,dynamic> json){
    id= json['id'];
    title= json['title'];
    auteur= json['auteur'];
    url= json['link'];
    /*if(json['image_url'] == false ) {
      imageUrlBool = json['image_url'];
    }
    else{*/
      imageUrl = json['image_url'];
    //}

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