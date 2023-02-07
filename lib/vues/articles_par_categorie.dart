import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/vues/details_page..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/modeles/categorie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';
import '../controllers/posts_controller.dart';


class ArticlesParCategorie extends StatefulWidget {
  final bool isReload;
  final int categorieId;
  const ArticlesParCategorie({Key? key,required this.isReload,required this.categorieId}) : super(key: key);
  static const routeName="/article-par-categorie";

  @override
  State<ArticlesParCategorie> createState() => _ArticlesParCategorieState();
}

class _ArticlesParCategorieState extends State<ArticlesParCategorie> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final PostsController postsController = Get.put(PostsController());
  final categories = Categorie.categories;
  List<NewsModele> articles = <NewsModele>[];


  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,() async{

      if(this.widget.isReload){
        await postsController.fetchCategorieByArticle(categoryId: widget.categorieId);
      }
    });
    //print(postsController.postsList.length);
  }


  @override
  Widget build(BuildContext context) {

    final String cat;
    if(postsController.postsList.isNotEmpty){
      cat = postsController.postsList.first.categoryName.toString();
    }else{
      cat="Aucune categorie";
    }
    /*final idCategorie = ModalRoute.of(context)!.settings.arguments as int;*/
    return Scaffold(
      //drawer:const MenuDrawer(),
      backgroundColor: Colors.grey,
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
           /* decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),*/
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: (){
                    Share.share("gggg");
                  },            ),

              ],
            ),
          )
        ],
      ),
     // bottomNavigationBar: const NavBar(index: 2),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async{
          Future.delayed(Duration.zero,() async{

            if(this.widget.isReload){
              await postsController.fetchCategorieByArticle(categoryId: widget.categorieId);
            }
          });
        },
        child: Obx((){
        if(postsController.isLoading.value) {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(

                children: [
                  const  SizedBox(height: 12,),
                  Container(
                    //padding:  const EdgeInsets.symmetric(horizontal: 8),

                    child: Row(
                      children:  [
                         Text(
                      cat
                          ,
                          style:  const TextStyle(
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
                        itemCount: postsController.postsList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context,index){
                          return  BlocTile(
                            imageUrl: postsController.postsList[index].imageUrl.toString(),
                            titre: postsController.postsList[index].title.toString(),
                            desc: postsController.postsList[index].postContent.toString(),
                            url: postsController.postsList[index].title.toString(),
                            arg: postsController.postsList[index],
                          );
                        }

                    ),
                  ),
                ],

              ),
            ),
          );
        }
        }),
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
  final  NewsModele arg;
  BlocTile({Key? key, required this.imageUrl,required this.titre,required this.desc,required this.url,required this.arg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,
          DetailsPage.routeName,
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
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 5,),
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
            )
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
