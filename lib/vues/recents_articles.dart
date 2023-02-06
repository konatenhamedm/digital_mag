import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_mag/controllers/posts_controller.dart';
import 'package:digital_mag/widgets/card_widget.dart';

import 'article_categorie_vue.dart';

class RecentsArticlesPage extends StatefulWidget {
  /*final int? categoryId;*/
  //final bool isReload;
  final int totalRecords;
  const RecentsArticlesPage({Key? key, required this.totalRecords}) : super(key: key);

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

      /*if(widget.isReload){*/
        await postsController.fetchPosts(pageNumber: 1,totalRecords: widget.totalRecords,);
      //}
    });
    _scrollController.addListener(() async{
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        await postsController.fetchPosts2(
            pageNumber: ++_page,
            totalRecords: widget.totalRecords,
        );
      }
    });

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
          return  Container(
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
                      itemCount: postsController.postsList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      controller: _scrollController,
                      itemBuilder: (context,index){
                        if((index == postsController.postsList.length -1) && postsController.postsList.length < widget.totalRecords){
                          return  Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return  BlocTileNewsModele(
                          imageUrl: postsController.postsList[index].imageUrl.toString(),
                          titre: postsController.postsList[index].title.toString(),
                          desc: postsController.postsList[index].title.toString(),
                          url: postsController.postsList[index].imageUrl.toString(),
                          arg: postsController.postsList[index],
                        );
                      }

                  ),
                ),
              ],
              // ],
            ),
          );

        }
      }
      ),
    );
  }
}
