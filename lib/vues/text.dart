import 'package:digital_mag/controllers/details_controller.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:digital_mag/utils/layout.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';

import '../modeles/article.dart';

class Texte extends StatefulWidget {
final int? category_id;
   Texte({Key? key, required this.category_id}) : super(key: key);
  static const routeName ='/detailsfff';

  @override
  State<Texte> createState() => _TexteState();
}

class _TexteState extends State<Texte> {
  final DetailsController detailsController = Get.put(DetailsController());

  NewsModele article = NewsModele();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () async {
      var article = await detailsController.fetchDetails(postId: widget.category_id);

    });
   // print(article);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics()
        ,
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
                background: backgroundImage()
            ),
            backgroundColor: Colors.transparent,elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            hasScrollBody:false,
            child: Obx((){
              if(detailsController.isLoading.value){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return AnimatedContainer(
                  color: detailsController.dark.isFalse ? Color(0xffF8F8F8):Color(0xff212121),
                  duration: Duration(milliseconds: 400),
                  child: newsDetailsSections(),
                );
                //return newsDetailsSections();
              }
            }),
          )
        ],
      ),
    );
  }

  Widget backgroundImage() {
    return Obx(() {
      if (detailsController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Image.network(
          detailsController.postModel.value.imageUrl.toString(),
          fit: BoxFit.cover,
        );
      }
    });
  }

  Widget newsDetailsSections(){
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row1(article),
          Layout.iconText( Icon(Icons.timer,color: detailsController.dark.isFalse ? Colors.black : Colors.white,),Text(detailsController.postModel.value.postedDate.toString(),style: TextStyle(
            color: detailsController.dark.isFalse ? Colors.black : Colors.white,
          ),)),
          const SizedBox(height: 15,),
          Text(
            detailsController.postModel.value.auteur.toString(),style:  TextStyle(
            fontSize: 16,
            color:  detailsController.dark.isFalse ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(
            child:  Divider(color: Colors.grey,thickness: 2,),
            width: 100,),
          Expanded(
            child: Html(
                defaultTextStyle: TextStyle(
                    fontSize: 15,
                    color: detailsController.dark.isFalse ? Colors.black : Colors.grey,
                    ),
             //ackgroundColor: ,
                data: detailsController.postModel.value.postContent.toString()

            ),
          )
        ],
      ),
    );
    // );
  }

  Widget Row1(NewsModele article){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),

            ),
            child:  Text(detailsController.postModel.value.categoryName.toString(),style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child:  Row(
            children:  [
              IconButton(

                onPressed: (){
                  detailsController.darkMode();
                },
                icon:  Icon(detailsController.dark.isFalse ? Feather.moon : Feather.sun,color: detailsController.dark.isFalse ? Colors.black : Colors.white,),

              ),
              IconButton(onPressed: (){
                Share.share(detailsController.postModel.value.url.toString());

                }, icon:  Icon(Icons.share,color: detailsController.dark.isFalse ? Colors.black : Colors.white,)
              ),
              IconButton(
                onPressed: (){
                 detailsController.favoriteArticle();
                },
                icon:  Icon(detailsController.favorite.isFalse ? Icons.favorite_border : Icons.favorite,color: detailsController.favorite.isFalse ? Colors.white : Colors.red,),

              ),
              IconButton(
                onPressed: (){
                  print('kks');
                },
                icon:  Icon(Icons.book_rounded,color: detailsController.dark.isFalse ? Colors.black : Colors.white,),

              ),

            ],
          ),

        ),
      ],
    );
  }
}
