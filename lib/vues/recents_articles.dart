import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_mag/controllers/posts_controller.dart';
import 'package:digital_mag/widgets/card_widget.dart';

import 'article_categorie_vue.dart';

class RecentsArticlesPage extends StatefulWidget {
  /*final int? categoryId;*/
  final bool isReload;

  const RecentsArticlesPage({Key? key,required this.isReload}) : super(key: key);

  @override
  State<RecentsArticlesPage> createState() => _RecentsArticlesPageState();
}

class _RecentsArticlesPageState extends State<RecentsArticlesPage> {

  final PostsController postsController = Get.put(PostsController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController = new ScrollController();
  int _page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,() async{

      if(widget.isReload){
        await postsController.articleRecentData();
      }
      /* if(widget.isReload){
        await c.fetchPosts2(pageNumber: 1,totalRecords: widget.totalRecords,);
      }*/
    });
    /* Future.delayed(Duration.zero,() async{

      if(widget.isReload){
        await postsController.fetchPosts(pageNumber: 1,totalRecords: widget.totalRecords,);
      }
    });
    _scrollController.addListener(() async{
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        await postsController.fetchPosts2(
            pageNumber: ++_page,
            totalRecords: widget.totalRecords,
        );
      }
    })*/;

  }
  @override
  Widget build(BuildContext context) {
    return RecentsArticlesList();
  }

  Widget RecentsArticlesList(){
    return Container(
      child: Obx(() {
        if(postsController.isLoading.value) {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () =>  postsController.fetchArticlerecents(),

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const  SizedBox(height: 5,),
                  Container(
                    //padding:  const EdgeInsets.symmetric(horizontal: 8),

                    child: Row(
                      children: const [
                        Text(
                          "Les articles recents ",
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.purple,
                            //decoration: TextDecoration.underline,
                            //decorationStyle: TextDecorationStyle.double,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        itemCount: postsController.articleRecentData.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context,index){

                          return  BlocTileNewsModele(
                            imageUrl:  postsController.articleRecentData[index].imageUrlBool !=null && postsController.articleRecentData[index].imageUrlBool == false ?
                            postsController.articleRecentData[index].imageUrl.toString() : "https://lataule.com/wp-content/uploads/2017/11/fond-gris-moyen.jpg",
                            titre: postsController.articleRecentData[index].title.toString(),
                            desc: postsController.articleRecentData[index].title.toString(),
                            url: postsController.articleRecentData[index].imageUrl.toString(),
                            arg: postsController.articleRecentData[index],
                          );
                        }

                    ),
                  ),
                ],
                // ],
              ),
            ),);

        }
      }
      ),
    );
  }
}
