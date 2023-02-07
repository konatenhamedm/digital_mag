import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:digital_mag/controllers/categories_controller.dart';
import 'package:digital_mag/widgets/news_page.dart';

import '../widgets/card_widget.dart';
import '../widgets/nav_bar.dart';

class LoveArticle extends StatefulWidget {
  const LoveArticle({Key? key}) : super(key: key);

  @override
  State<LoveArticle> createState() => _LoveArticleState();
}

class _LoveArticleState extends State<LoveArticle> {
 //List<Widget> tabs = [];

 final CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

/*    tabs.add(tab("Mobile"));
    tabs.add(tab("Actualite-it"));
    tabs.add(tab("Decryptage"));
    tabs.add(tab("Interview"));
    tabs.add(tab("Telecom"));*/
  }
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey,
    child: Obx((){
      if(categoriesController.isLoading.value) {
        return  const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return DefaultTabController(
        length: categoriesController.categoriesList.length,
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.black,

            title: const Center(child: Text("Digital mag",style: TextStyle(color: Colors.white),),),
            elevation: 0,
            bottom: TabBar(
              tabs: categoriesController.categoriesList.map(
                      (model) => tab(model.libelle.toString())).toList(
                growable: false,
              ),
              isScrollable: true,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.white
              ,indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.redAccent,),
            actions:const [
              Icon(Icons.search,color:Colors.white),
              SizedBox(width: 10,),
              Icon(Icons.notifications,color:Colors.white),
              SizedBox(width: 10,),
            ],
          ),
          //bottomNavigationBar: const NavBar(index: 2),
          body: TabBarView(
            children: categoriesController.categoriesList.map((model)
             {
              return NewsPage(categoryId:model.id, isReload: true,totalRecords:model.count!);
            }
            ).toList(),
          ),

        ),

      );
      }
    }),
    );

  }

  Widget tab(String tabName){
   return Tab(
     text:tabName
   );
  }
}
