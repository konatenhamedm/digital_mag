import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/modeles/news_modele.dart';

import '../utils/layout.dart';
import '../vues/details_page..dart';

class CardWidget extends StatelessWidget {
  final NewsModele modele;
  const CardWidget({Key? key,required this.modele}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 0,
      shape:  RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(
          16.0
        ),

      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsPage()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                    child: Image.network(modele.imageUrl.toString()),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(modele.categoryName.toString()
                        ,style: const TextStyle(
                          color: Colors.white,
                        fontSize: 5,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  )
                ],
              ),
            Padding(
                padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                   Text(
                    modele.title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                 const  SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Layout.iconText(const Icon(Icons.timer),  Text(modele.postedDate.toString(),
                        style: const TextStyle(
                        fontSize: 14,color: Colors.black
                      ),)),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsPage()));
                        },
                        child: const Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
