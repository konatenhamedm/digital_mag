import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String nom,urlImage;
  const UserProfile({Key? key,required this.nom,required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(nom),
          centerTitle: true,
      ),
      body: Image.asset("assets/images/img.jpg",
      width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
