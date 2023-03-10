import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<NotificationModele> notoificationFromJson(String str)=>
    List<NotificationModele>.from(
      json.decode(str).map(
            (x)=>NotificationModele.fromJson(x),
      ),
    );


NotificationModele fromJsonToNotoification(String str) => NotificationModele.fromJson(json.decode(str));


class NotificationModele {
  int? id;
  String? title;
  String? imageUrl;
  bool? imageUrlBool=false;
  String? postedDate;
  int? categoryId;
  String? categoryName;
  String? postContent;
  String? auteur;
  String? url;


  NotificationModele( {
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

  factory NotificationModele.fromJson1(Map<String, dynamic> addjson){

    return NotificationModele(
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

  NotificationModele.fromJson(Map<String,dynamic> json){
    id= json['id'];
    title= json['title'];
    auteur= json['auteur'];
    url= json['link'];
    if(json['image_url'] == null || json['image_url'] == "" || json['image_url'] == false ) {
      imageUrlBool = true;
    }
    else {
      imageUrl = json['image_url'];
      imageUrlBool = false;
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