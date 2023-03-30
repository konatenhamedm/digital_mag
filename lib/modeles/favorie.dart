import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Favorie> favorieFromJson(String str)=>
    List<Favorie>.from(
      json.decode(str).map(
            (x)=>Favorie.fromJson(x),
      ),
    );


Favorie fromJsonToFavorie(String str) => Favorie.fromJson(json.decode(str));


class Favorie {
  int? id;
  String? title;
  String? content;
  bool? etat;
  String? dateCreation;



  Favorie( {
    this.id,
    this.title,
    this.content,
    this.etat,
    this.dateCreation,

  });

  factory Favorie.fromJson1(Map<String, dynamic> addjson){

    return Favorie(
      id: addjson["id"],
      title:  addjson["titre"],
      content: addjson["content"],
      etat: addjson['etat'],
      dateCreation : addjson['dateCreation'],

    );
  }

  Favorie.fromJson(Map<String,dynamic> json){
    id= json['id'];
    title= json['titre'];
    content= json['content'];
    etat= json['etat'];
    dateCreation= json['dateCreation'];

  }
}