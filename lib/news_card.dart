import 'package:digital_mag/vues/details_page..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';

import 'constants.dart';
import 'modeles/news_modele.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.image,
    required this.arg,
  }) : super(key: key);

  final String image;
  final NewsModele arg;

  @override
  Widget build(BuildContext context) {
    return Card(
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
          Get.to(DetailsPage(post_id: arg.id,));
          //print("LEOOOOOOOO");
          //print(modele.id);
        },
        child: Column(

          children: [
            Row(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(

                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0),
                      bottomLeft:Radius.circular(5.0) ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(
                  horizontal: 0.0),
                    child: SizedBox(
                      height: 120,

                      width: 120,
                      child: Image.network(
                        arg.imageUrlBool !=null && arg.imageUrlBool == false ?
                        arg.imageUrl.toString() : "https://lataule.com/wp-content/uploads/2017/11/fond-gris-moyen.jpg"
                        ,fit: BoxFit.cover,),

                      //Image.asset("assets/images/1.jpg"),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     /* Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          *//*Text(
                            "",
                            style: Theme.of(context).textTheme.caption,
                          ),*//*
                        ],
                      ),*/
                       Padding(
                        padding:  const EdgeInsets.symmetric(
                            vertical: 1.0),
                        child: Text(
                          arg.title.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const  SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          //Row(

                           // children: [
                              Text(arg.auteur.toString(),style: const TextStyle(
                                fontSize: 12,

                              ),),
                             // const SizedBox(width: 39,),
                              Text("${arg.postedDate.toString()}" ,style: const TextStyle(
                                fontSize: 12,

                              )),
                           // ],
                          //),


                        ],
                      ),
                      const  SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                           // alignment: Alignment.le,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(arg.categoryName.toString()
                                ,style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 5,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.share_outlined),
                            onPressed: (){
                              Share.share(arg.url.toString());
                            },            ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: (){
                              Share.share(arg.url.toString());
                            },            ),

                          IconButton(
                            icon: const Icon(Icons.book_rounded),
                            onPressed: (){
                              //Share.share("gggg");
                            },            ),

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}