import 'package:digital_mag/vues/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';

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
          /*Navigator.pushNamed(context,
            Texte.routeName,
            arguments: modele,
          );*/
        //  Get.to(() => Texte(),arguments:0 );
          Get.to(DetailsPage(post_id: modele.id,));
          //print("LEOOOOOOOO");
          //print(modele.id);
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
                    child: modele.imageUrlBool == false ? Image.network(
                        modele.imageUrl.toString()
                         ,fit: BoxFit.cover,):Image.asset("assets/images/fond-gris-moyen.jpg"),
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
                  ),
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Share.share(modele.url.toString());

                              //Navigator.push(context,MaterialPageRoute(builder: (context)=>Texte()));
                              //Get.to(Texte(),arguments: 7724);
                            },
                            child: const Icon(Icons.share),
                          ),
                          const SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              Share.share(modele.url.toString());

                              //Navigator.push(context,MaterialPageRoute(builder: (context)=>Texte()));
                              //Get.to(Texte(),arguments: 7724);
                            },
                            child: const Icon(Icons.book_rounded),
                          )
                        ],
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
