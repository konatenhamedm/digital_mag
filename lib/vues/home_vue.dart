import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:digital_mag/widgets/_new_of_day.dart';
import 'package:digital_mag/widgets/image_container.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/categories_controller.dart';
import '../controllers/posts_controller.dart';
import '../helper/news.dart';
import '../modeles/article.dart';
import '../modeles/categorie.dart';
import '../widgets/carroussel_loading.dart';
import '../widgets/carroussel_slide_data.dart';
import '../widgets/nav_bar.dart';
import 'article_categorie_vue.dart';
import 'article_vue.dart';

class HomeVue extends StatefulWidget {
  const HomeVue({Key? key}) : super(key: key);


  @override
  State<HomeVue> createState() => _HomeVueState();
}

class _HomeVueState extends State<HomeVue> {

  Article article = Article.articles[1];
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
                  ,size: 15,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
      ),
    );
  }
  Widget mostPopularListWiewWidget(BuildContext context){
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return CategorieTile(imageUrl:
            categories[index].imageUrl,
                categorieName: categories[index].libelle);
          }),
    );
  }
  Widget espacePubWidget(BuildContext context){
    return const ImageContainer(
      width: double.infinity,
      heigth: 120,
      padding: EdgeInsets.all(15.0),
      imageUrl: "https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    );


  }
  Widget moreWidget(BuildContext context,String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),

        ),
        InkWell(
          onTap: (){

          },
          child: const Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        )

      ],
    );
  }

  Widget tab(String tabName){
    return Tab(
        text:tabName
    );
  }

  Widget titreWidget(BuildContext context,String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const  Text(
          "DIGITAL MAG: ",
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.purple,
            decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,

          ),

        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),

        ),
      ],
    );
  }

  Widget searchFoodWidget(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
          height: 45,
          width: 200,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            //borderRadius: BorderRadius.circular(),
          ),
          //color: Colors.white,
          child:   TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon:  const Icon(Icons.search,color: Colors.black,),
              hintText: "Restaurants,Foods...",
              hintStyle: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 13
              ),

            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(18),

          ),
          child: const Icon(Icons.tune,color: Colors.black,),
        )
      ],
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

class _ArticleRecent extends StatelessWidget {
  const _ArticleRecent({
    Key? key,required this.articles,required this.text
  }) : super(key: key);
final String text;
  final List<Article> articles ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               //mainAxisAlignment: MainAxisAlignment.start,
               children: [
                Row(
                  children: [
                    const  Text(
                      "DIGITAL MAG: ",
                      style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                      ),

                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),

                    ),
                  ],
                )

               ],
             ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                     /* Navigator.pushNamed(context,
                        ArticleVues.routeName,
                        arguments: articles[index],
                      );*/
                    },
                    child: Text('Lire plus',
                        style: Theme.of(context).textTheme.bodyLarge),
                  )
                ],
              )
              /* Text('Mobile',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold),),*/
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(height: 250,child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,
                        ArticleVues.routeName,
                        arguments: articles[index],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                            width: MediaQuery.of(context).size.width*0.5,
                            imageUrl: articles[index].imageUrl.toString()
                        ),
                        const SizedBox(height: 10),
                        Text(articles[index].titre.toString(),
                          maxLines:2,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,height: 1.5),),

                        const SizedBox(height: 5),
                        //${DateTime.now().difference(articles[index].publishedAt).inHours}
                        Text('Il y a 3hk',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 5),
                        Text('Ecrit par : ${articles[index].auteur}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],),
                  ),

                );

              }),)
        ],
      ),
    );
  }
}






