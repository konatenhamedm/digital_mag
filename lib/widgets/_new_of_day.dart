import 'package:digital_mag/widgets/style_tag.dart';
import 'package:flutter/cupertino.dart';
import '../modeles/article.dart';
import '../vues/article_vue.dart';
import 'image_container.dart';
import 'package:flutter/material.dart';

class NewsOfDay extends StatelessWidget {
  const NewsOfDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      imageUrl: article.imageUrl.toString(),
      heigth: MediaQuery.of(context).size.height*0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyleTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children:
              [
                Text('A la une',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,fontWeight: FontWeight.bold),)
              ]
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,
                ArticleVues.routeName,
                arguments: article,
              );
            },
            child: Text(article.titre.toString(), style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold ,
                height: 1.25,
                color: Colors.white)
            ),
          ),
          TextButton(onPressed:  () {
            Navigator.pushNamed(context,
              ArticleVues.routeName,
              arguments: article,
            );
          },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child:
              Row(
                children: [
                  Text('Lire plus',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white),),
                  const SizedBox(width: 10,),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  )

                ],
              )
          )

        ],
      ),
    );
  }
}