import 'package:digital_mag/controllers/posts_controller.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/widgets/carroussel_loading.dart';
import 'package:digital_mag/widgets/carroussel_slide_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/categories_controller.dart';
import '../helper/news.dart';
import '../modeles/article.dart';
import '../modeles/categorie.dart';
import '../widgets/nav_bar.dart';
import '../widgets/news_page.dart';
import 'article_categorie_vue.dart';
import 'home_vue.dart';

class Slide extends StatefulWidget {

  const Slide({Key? key}) : super(key: key);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  final CategoriesController categoriesController = Get.put(CategoriesController());
  final PostsController c = Get.put(PostsController());
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
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        leading:  MenuDrawere(),
        backgroundColor: Colors.transparent,
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
      bottomNavigationBar: const NavBar(index: 0),
      body: SingleChildScrollView(
        child: SafeArea(
          left: false,
          top: true,
          bottom: true,
          right: false,
          child: Column(
            children: [
              Obx((){
                if(c.isLoading.value){
                  return const CarrousselLoading();
                }else{

                  return Column(
                    children: [
                      CarrousselSlideData(c.carousselData),
                      const SizedBox(height: 5,),
                    ],
                  );
                }

              }),
             /* SingleChildScrollView(*/
              _loading ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
              :Container(
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
                    // ],
                  ),
                ),
            /*  ),*/

            ],
          )
        ),
      ),
    );
  }

  Widget tab(String tabName){
    return Tab(
        text:tabName
    );
  }
}
class MenuDrawere extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: (){
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu,color: Colors.black,),
    );
  }

}
