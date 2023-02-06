import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modeles/categorie.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key,required this.onChange,required this.selectedIndex}) : super(key: key);
final ValueChanged<int>onChange;
 final int selectedIndex;
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Categorie> categories = Categorie.categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            categories.length,
            (index)=>Padding(
                padding: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: (){

              },

              style: TextButton.styleFrom(
                primary: widget.selectedIndex == index
                    ?Colors.black
                    :Colors.black45
              ),
              child: Text(
                categories[index].libelle.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            )
        ),
      ),
    );
  }
}
