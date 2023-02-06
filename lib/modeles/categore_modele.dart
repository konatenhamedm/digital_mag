import 'dart:convert';

import 'package:flutter/material.dart';

List<CategorieModele> categorieFromJson(String str)=> List<CategorieModele>.from(
  json.decode(str).map(
      (x)=>CategorieModele.fromJson(x),
  ),
);

class CategorieModele {
  int? id;
  String? libelle;
  int? count;

  CategorieModele({
    this.id,
    this.libelle,
    this.count,
});
  CategorieModele.fromJson(Map<String,dynamic> json){
    id= json['id'];

    if(json['id'] == 48){
      libelle= "Actu-it";
    }else{
     libelle= json['name'];
    }
    count = json['count'];
  }
}