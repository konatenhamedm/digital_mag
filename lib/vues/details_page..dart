import 'package:digital_mag/modeles/news_modele.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:digital_mag/utils/layout.dart';
import 'package:share/share.dart';

import '../modeles/article.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({Key? key}) : super(key: key);
  static const routeName ='/details';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as NewsModele;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics()
        ,
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(article.imageUrl.toString(),
              fit: BoxFit.cover,
              )
            ),
            backgroundColor: Colors.transparent,elevation: 0.0,
              expandedHeight: 250,
          ),
          SliverFillRemaining(
            hasScrollBody:false,
            child: newsDetailsSections(article),
          )
        ],
      ),
    );
  }

  Widget newsDetailsSections(NewsModele article){
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row1(article),
            Layout.iconText(const Icon(Icons.timer),Text(article.postedDate.toString())),
             const SizedBox(height: 15,),
             Text(
              article.auteur.toString(),style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              child:  Divider(color: Colors.grey,thickness: 2,),
              width: 100,),
            Expanded(
              child: Html(
                data: article.postContent.toString()
              ),
            )
          ],
        ),
      );
   // );
  }

  Widget Row1(NewsModele article){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),

            ),
            child:  Text(article.categoryName.toString(),style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
         Align(
          alignment: Alignment.topRight,
          child:  Row(
            children:  [
              IconButton(
                onPressed: (){
                  print('kks');
                },
                icon: const Icon(Feather.moon),

              ),
              IconButton(onPressed: (){
                Share.share(article.url.toString());
              }, icon: const Icon(Icons.share)
              ),
              IconButton(
                onPressed: (){
                  print('kks');
                },
                icon: const Icon(Icons.favorite_border),

              ),
              IconButton(
                onPressed: (){
                  print('kks');
                },
                icon: const Icon(Icons.book_rounded),

              ),

            ],
          ),

        ),
      ],
    );
  }
}
