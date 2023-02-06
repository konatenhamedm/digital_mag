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
  String? imageUrl;
  String? postedDate;
  int? categoryId;
  String? categoryName;
  String? postContent;


  NewsModele(param0,  {
    this.id,
    this.title,
    this.imageUrl,
    this.postedDate,
    this.categoryId,
    this.categoryName,
    this.postContent,
  });
  NewsModele.fromJson(Map<String,dynamic> json){
    id= json['id'];
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

  }
}