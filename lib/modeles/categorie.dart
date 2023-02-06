import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
class Categorie extends Equatable{
  int? id;
  String? libelle;
  String? imageUrl;

  Categorie({
     this.id,
     this.libelle,
     this.imageUrl,
});
/*  static List<MenuItem> items = [

  ];*/
  static List<Categorie> categories = [
    Categorie(id:1 ,
  libelle:"mobile"
  ,imageUrl:"https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" ),

    Categorie(id:2 ,
  libelle: "telecom",
  imageUrl:"https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" ),

    Categorie(id:3 ,
  libelle:"interview"
  ,imageUrl: "https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
    Categorie(id: 4,libelle:"Decryptage" ,imageUrl:"https://media.istockphoto.com/id/1455333566/fr/photo/informatique-r%C3%A9seau-de-s%C3%A9curit%C3%A9-pare-feu-serveur-internet-cloud-computing.jpg?b=1&s=170667a&w=0&k=20&c=z1SSF0XX6Ld0On4vO0e1_V4CWhF9DoN_Gmf9dfsC8GI=" )
    ,Categorie(id:5 ,
        libelle: "actu-it",
        imageUrl:"https://images.unsplash.com/photo-1592862037671-e8b981b49dcf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHRlbGVjb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60" ),
    Categorie(id:6 ,
        libelle:"mobile money"
        ,imageUrl:"https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" ),


  ]
;


  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    libelle,
    imageUrl,

  ];}