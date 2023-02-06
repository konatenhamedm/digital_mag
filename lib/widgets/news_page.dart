import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_mag/controllers/posts_controller.dart';
import 'package:digital_mag/widgets/card_widget.dart';

class NewsPage extends StatefulWidget {
  final int? categoryId;
  final bool isReload;
  final int totalRecords;
  const  NewsPage({Key? key,required this.categoryId,required this.isReload, required this.totalRecords}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

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
        await postsController.fetchPosts(categoryId: widget.categoryId,pageNumber: 1,totalRecords: widget.totalRecords,);
      }
    });
    _scrollController.addListener(() async{
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        await postsController.fetchPosts(
          pageNumber: ++_page,
          totalRecords: widget.totalRecords,
          categoryId: widget.categoryId
        );
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList(){
    return Container(
      child: Obx(() {
        if(postsController.isLoading.value) {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        } else {
        return RefreshIndicator(
          key: refreshKey,
          onRefresh: () async{

             this._page = 1;
                await postsController.fetchPosts(
                  categoryId: widget.categoryId,
                  pageNumber: 1,
                  totalRecords: widget.totalRecords,);


          },
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: postsController.postsList.length,
                controller: _scrollController,
                itemBuilder: (context ,index){
                  if((index == postsController.postsList.length -1) && postsController.postsList.length < widget.totalRecords){
                    return  Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CardWidget(modele: postsController.postsList[index]);
                }

            ),);



        }
      }
      ),
    );
  }
}
