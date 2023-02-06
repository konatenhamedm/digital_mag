import 'package:digital_mag/modeles/article.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

import '../widgets/style_tag.dart';

class ArticleVues extends StatelessWidget {
  const ArticleVues({Key? key}) : super(key: key);
  static const routeName ='/article';
  @override
  Widget build(BuildContext context) {
    //print({context});
    final article = ModalRoute.of(context)!.settings.arguments as NewsModele;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl.toString(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(padding: EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(Icons.share_outlined),
              onPressed: (){
                Share.share(article.imageUrl.toString());
              },            ),
            )
          ],
        ),

        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadline2(article: article,),
            _NewsBody2(article: article)
          ],
        ),
      ),
    );
  }
}
class _NewsBody2 extends StatelessWidget {
  const _NewsBody2({
    Key? key,
    required this.article,
  }) : super(key: key);

  final NewsModele article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),

      child: Column(
        children: [
          Row(
            children: [
              StyleTag(
                  backgroundColor: Colors.black,
                  children:
                  [
                    /* CircleAvatar(radius: 5,
                     *//*backgroundImage: NetworkImage(
                       article.auteurImageUrl //? article.auteurImageUrl:"",
                     ),*//*
                     ),*/
                    // const SizedBox(width: 5,),
                    Text(article.postedDate.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white
                      ),
                    )
                  ]
              ),
              const SizedBox(width: 3,),
              StyleTag(
                  backgroundColor: Colors.grey.shade200,
                  children:
                  [
                    const   Icon(
                      Icons.timer,color: Colors.grey,
                    ),

                    const SizedBox(width: 3,),
                    Text('Il y a ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
              ),
              const SizedBox(width: 3,),
              StyleTag(
                  backgroundColor: Colors.grey.shade200,
                  children:
                  [
                    const   Icon(
                      Icons.remove_red_eye,color: Colors.grey,
                    ),

                    const SizedBox(width: 3),
                    Text('4 vues',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Text(article.title.toString(),
            style: Theme.of(context)
                .textTheme.headlineSmall!
                .copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Html(
                data: article.postContent.toString()
            ),
          ),
          const SizedBox(height: 20,),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25),
              itemBuilder: (context,index){
                return ImageContainer(width: MediaQuery.of(context).size.width*0.42,
                  imageUrl: article.imageUrl.toString(),
                  margin: const EdgeInsets.only(right: 5.0,bottom: 5.0),
                );
              })
        ],
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),

      child: Column(
        children: [
          Row(
            children: [
              StyleTag(
                  backgroundColor: Colors.black,
                  children:
                  [
                    /* CircleAvatar(radius: 5,
                     *//*backgroundImage: NetworkImage(
                       article.auteurImageUrl //? article.auteurImageUrl:"",
                     ),*//*
                     ),*/
                    // const SizedBox(width: 5,),
                    Text(article.auteur.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white
                      ),
                    )
                  ]
              ),
              const SizedBox(width: 3,),
              StyleTag(
                  backgroundColor: Colors.grey.shade200,
                  children:
                  [
                    const   Icon(
                      Icons.timer,color: Colors.grey,
                    ),

                    const SizedBox(width: 3,),
                    Text('Il y a ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
              ),
              const SizedBox(width: 3,),
              StyleTag(
                  backgroundColor: Colors.grey.shade200,
                  children:
                  [
                    const   Icon(
                      Icons.remove_red_eye,color: Colors.grey,
                    ),

                    const SizedBox(width: 3),
                    Text('55vues',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Text(article.titre.toString(),
            style: Theme.of(context)
                .textTheme.headlineSmall!
                .copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Html(
                data: article.content.toString()
            ),
          ),
          const SizedBox(height: 20,),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25),
              itemBuilder: (context,index){
                return ImageContainer(width: MediaQuery.of(context).size.width*0.42,
                  imageUrl: article.imageUrl.toString(),
                  margin: const EdgeInsets.only(right: 5.0,bottom: 5.0),
                );
              })
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,required this.article
  }) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
          StyleTag(
              backgroundColor: Colors.black.withAlpha(150),
              children:
              [
                Text("Catégorie",
                  //article.auteur.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white
                    ,height: 1.0,
                  ),
                )
              ]
          ),
          const SizedBox(height: 10,),
          Text(article.titre.toString(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white),),
          const SizedBox(height: 10,),
          Text(article.desc.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white),)
        ],
      ),
    );
  }
}

class _NewsHeadline2 extends StatelessWidget {
  const _NewsHeadline2({
    Key? key,required this.article
  }) : super(key: key);
  final NewsModele article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
          StyleTag(
              backgroundColor: Colors.black.withAlpha(150),
              children:
              [
                Text("Catégorie",
                  //article.auteur.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white
                    ,height: 1.0,
                  ),
                )
              ]
          ),
          const SizedBox(height: 10,),
          Text(article.title.toString(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white),),
          const SizedBox(height: 10,),
          Text(article.title.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white),)
        ],
      ),
    );
  }
}
