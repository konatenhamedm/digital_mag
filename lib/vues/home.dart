import 'package:digital_mag/helper/news.dart';
import 'package:digital_mag/vues/article_categorie_vue.dart';
import 'package:digital_mag/vues/article_vue.dart';
import 'package:digital_mag/modeles/article.dart';
import 'package:digital_mag/vues/recents_articles.dart';
import 'package:digital_mag/widgets/_new_of_day.dart';
import 'package:digital_mag/widgets/image_container.dart';
import 'package:digital_mag/widgets/nav_bar_boutton.dart';
import 'package:digital_mag/widgets/style_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/categories_controller.dart';
import '../controllers/posts_controller.dart';
import '../modeles/categorie.dart';
import '../modeles/news_modele.dart';
import '../widgets/carroussel_loading.dart';
import '../widgets/carroussel_slide_data.dart';
import '../widgets/nav_bar.dart';
import 'home_vue.dart';
import 'menu_drawer.dart';

class Home extends StatefulWidget {
  final bool isReload;
  final int totalRecords;
  const Home({Key? key,required this.isReload, required this.totalRecords}) : super(key: key);

  static const routeName ='/hh';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final PostsController c = Get.put(PostsController());


  bool _loading = true;

  @override
  void initState(){

    super.initState();
    getArticles();

    Future.delayed(Duration.zero,() async{

      if(widget.isReload){
        await c.carousselData();
        await c.articleRecentData();
      }


    });

  }

  getArticles() async{
    News news = News();
    await news.getArticle();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer:const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
       title: const Center(child: Text("Digital mag",style: TextStyle(color: Colors.white),),),
      ),
      extendBodyBehindAppBar: true,
      body:  RefreshIndicator(
        key: refreshKey,
        onRefresh: () =>  c.fetchArticlerecents(),
        child: SingleChildScrollView(
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
                              /*if(_loading)  Center(
                                child: Container(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                                  :
                              RecentsArticlesPage(totalRecords: c.postsList.length,),*/
                            ],
                          );
                        }

                      }),
                      _loading ?  Center(
                        child:  CircularProgressIndicator(),
                      )
                          :RecentsArticlesPage(isReload: true,)
                     /* Obx((){
                        return RecentsArticlesPage(isReload: true,totalRecords: c.postsList.length,);
                      })*/
                     /* _loading ?  Center(
                        child:  CircularProgressIndicator(),
                      )
                          :RecentsArticlesPage(isReload: true,totalRecords: c.postsList.length,),*/
                    ],
                  )
              ),

          ),
      ),
      // ),
    );
  }
}








