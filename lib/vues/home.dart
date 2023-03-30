import 'package:digital_mag/controllers/user_login_controller.dart';
import 'package:digital_mag/helper/news.dart';
import 'package:digital_mag/vues/page_notification.dart';
import 'package:digital_mag/vues/recents_articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/notification_controller.dart';
import '../controllers/posts_controller.dart';
import '../modeles/login_modele.dart';
import '../services/share_service.dart';
import '../widgets/carroussel_loading.dart';
import '../widgets/carroussel_slide_data.dart';
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
  final NotificationController notificationController = Get.put(NotificationController());
  final UserLoginController userLoginController = Get.put(UserLoginController());
 int counter = 0;
  var _result;
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
    final prefs = await SharedPreferences.getInstance();
    News news = News();
    await news.getArticle();
     //var element = await ShareService.setLoginDetails();
    WidgetsFlutterBinding.ensureInitialized();
     _result = await ShareService.islLogin();
    setState(() {
      _loading = false;
    });
print("YAPIIIIIIIII ${_result}");
print("YAPIIIIIIIII ${prefs.getString("id")}");
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.lime])),
      child:
      Scaffold(
        backgroundColor: Colors.transparent,
        drawer:const MenuDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
         title:Image.asset("assets/images/logo_mobile.png"),//const Center(child: Text("Digital mag",style: TextStyle(color: Colors.white),),),
       actions: [
         Obx((){
           if(c.isLoading.value){
            return const Center(
              child: CircularProgressIndicator(),
            );
           }else{
               return Stack(
                 children: [
                   IconButton(icon: const Icon(Icons.notifications),
                       onPressed: () {
                         //Navigator.push(context,MaterialPageRoute(builder: (context)=>Texte()));
                         (userLoginController.isTrue.value == true || _result == true) ? Get.to(PageNotification()) : null;
                         /*setState(() {
                       counter = notificationController.notificationList.length;
                     }

                     );*/
                       }),


                   // counter != 0 ?

                   Positioned(
                     right: 8,
                     top: 11,
                     child:  Container(
                       padding: const EdgeInsets.all(2),
                       decoration:  BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(6),
                       ),
                       constraints: const BoxConstraints(
                         minWidth: 14,
                         minHeight: 14,
                       ),
                       child:  Text(
                         //'2',
                         (userLoginController.isTrue.value == true || _result == true)? '${notificationController.notificationList.length}':"0",
                         style: const TextStyle(
                           color: Colors.white,
                           fontSize: 8,
                         ),
                         textAlign: TextAlign.center,
                       ),
                     ),
                   )
                 ],
               );


           }


         })


       ],
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
                        _loading ?  const Center(
                          child:   CircularProgressIndicator(),
                        )
                            :const RecentsArticlesPage(isReload: true,)
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
      ),
    );
  }
}








