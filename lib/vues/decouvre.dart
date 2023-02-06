import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/modeles/categorie.dart';
import 'package:digital_mag/widgets/categories.dart';

import '../widgets/decouvre_app_bar.dart';

class Decouvre extends StatefulWidget {
  const Decouvre({Key? key}) : super(key: key);

  @override
  State<Decouvre> createState() => _DecouvreState();
}

class _DecouvreState extends State<Decouvre> {
  List<Categorie> categories = Categorie.categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DecouvreAppBar(),
          SliverToBoxAdapter(
            child: DecouvreInfo(),
          ),
          SliverToBoxAdapter(
            child: Categories(
              onChange: (value){},
              selectedIndex: 0,
            ),
          ),
          /*SliverList(
              delegate: SliverChildBuilderDelegate((context, categorieIndex){
            // List<MenuItem> items = categories[categorieIndex];
               // return MenuCategorieItem(titre:categories[categorieIndex].libelle,
             //item:[],
             );
          },
          childCount: categories.length,
          )),*/
        ],
      ),
    );
  }
  Widget DecouvreInfo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(

          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Digital mag 100% medi" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Text("My global function redirects users to offline home" ,style: TextStyle(fontSize: 12),),

            ],
          ),
        ),
      ],
    );
  }
}
