import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/vues/details_page..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/helper/news.dart';
import 'package:digital_mag/modeles/article.dart';
import 'package:digital_mag/modeles/categorie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_mag/vues/article_vue.dart';
import 'package:share/share.dart';

import '../helper/data.dart';
import '../widgets/nav_bar.dart';
import 'home_vue.dart';
import 'menu_drawer.dart';


class ArticleCategorieVue extends StatefulWidget {
  const ArticleCategorieVue({Key? key}) : super(key: key);
  static const routeName="/article-categorie";

  @override
  State<ArticleCategorieVue> createState() => _ArticleCategorieVueState();
}

class _ArticleCategorieVueState extends State<ArticleCategorieVue> {
  final categories = Categorie.categories;
   List<Article> articles = <Article>[];
  bool _loading = true;
  @override
  void initState(){
    super.initState();
    categories;
    getArticles();
    // print(categories);
  }

  getArticles() async{
    News news = News();
    await news.getArticle();
    articles = news.articles;
    print(articles);
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer:const MenuDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Center(child: Text("Digital mag",style: TextStyle(color: Colors.white),),),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: 80,
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
                const Icon(Icons.location_on
                  ,size: 12,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavBar(index: 2),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
             const  SizedBox(height: 12,),
                Container(
                 //padding:  const EdgeInsets.symmetric(horizontal: 8),

                  child: Row(
                    children: const [
                        Text(
                        "ACTUALITE IT: ",
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.purple,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                        ),
                      ),
                    ],
                ),
                  ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return  BlocTile(
                      imageUrl: articles[index].imageUrl.toString(),
                      titre: articles[index].titre.toString(),
                      desc: articles[index].desc.toString(),
                      url: articles[index].url.toString(),
                      arg: articles[index],
                      );
                    }

                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
class CategorieTile extends StatelessWidget{
  final imageUrl,categorieName;
  const CategorieTile({Key? key, this.imageUrl,this.categorieName}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categorieName,style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),),
            ),
          ],
        )
      ),
    );
  }
}

class BlocTile extends StatelessWidget{

  final String imageUrl,titre,desc,url;
  final  Article arg;
   BlocTile({Key? key, required this.imageUrl,required this.titre,required this.desc,required this.url,required this.arg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (){
       Navigator.pushNamed(context,
         ArticleVues.routeName,
         arguments: arg,
       );
     ///Navigator.push();
         //builder: (context)=>ArticleVues(blocUrl: url)));
     },
     child: Container(
       margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          const SizedBox(height: 8,),
          Text(titre,style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(height: 8,),
          Text(desc,style: const TextStyle(
              color: Colors.black54,
          )),
        ],
      ),
     ),
   );
  }

}

class BlocTileNewsModele extends StatelessWidget{

  final String imageUrl,titre,desc,url;
  final  NewsModele arg;
  BlocTileNewsModele({Key? key, required this.imageUrl,required this.titre,required this.desc,required this.url,required this.arg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,
          DetailsPage.routeName,
          arguments: arg,
        );
        print("hello konate");
        ///Navigator.push();
        //builder: (context)=>ArticleVues(blocUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(height: 8,),
            Text(titre,style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ecrit par : k Hamed"),
                SizedBox(width: 8,),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          onPressed: (){
                            Share.share("gggg");
                          },            ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: (){
                            // Share.share("gggg");
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
              ],
            ),
          ],
        ),
      ),
    );
  }

}
