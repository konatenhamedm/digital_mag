import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_mag/controllers/posts_controller.dart';
import 'package:digital_mag/widgets/card_widget.dart';
import 'package:share/share.dart';

import '../modeles/news_modele.dart';

class ArticlesParcategorie extends StatefulWidget {
  final int? categoryId;
  final bool isReload;
  final int totalRecords;
  const  ArticlesParcategorie({Key? key,required this.categoryId,required this.isReload, required this.totalRecords}) : super(key: key);

  @override
  State<ArticlesParcategorie> createState() => _ArticlesParcategorieState();
}

class _ArticlesParcategorieState extends State<ArticlesParcategorie> {

  final PostsController postsController = Get.put(PostsController());

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = new ScrollController();
  int _page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,() async{

      if(widget.isReload){
        var article = await postsController.fetchPosts(categoryId: widget.categoryId,pageNumber: 1,totalRecords: widget.totalRecords,);

        // print(article);
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
    return Scaffold(
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
                      Share.share("https://www.digital-mag.ci/");
                    },            ),

                ],
              ),
            )
          ],
        ),
        body: newsList());
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
                itemCount: postsController.loveListe.length,
                controller: _scrollController,
                itemBuilder: (context ,index){
                  if((index == postsController.loveListe.length -1) && postsController.loveListe.length < widget.totalRecords){
                    return  const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CardWidget(modele: postsController.loveListe[index]);
                }

            ),);



        }
      }
      ),
    );
  }
}
