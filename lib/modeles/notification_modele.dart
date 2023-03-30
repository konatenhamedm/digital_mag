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
  String? content;
  bool? etat;
  String? dateCreation;



  NotificationModele( {
    this.id,
    this.title,
    this.content,
    this.etat,
    this.dateCreation,

  });

  factory NotificationModele.fromJson1(Map<String, dynamic> addjson){

    return NotificationModele(
        id: addjson["id"],
        title:  addjson["titre"],
        content: addjson["content"],
        etat: addjson['etat'],
        dateCreation : addjson['dateCreation'],

    );
  }

  NotificationModele.fromJson(Map<String,dynamic> json){
    id= json['id'];
    title= json['titre'];
    content= json['content'];
    etat= json['etat'];
    dateCreation= json['dateCreation'];

  }
}