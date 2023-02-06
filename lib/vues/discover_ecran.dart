import 'dart:ui';
import 'package:flutter/material.dart';
import '../modeles/article.dart';
import '../widgets/image_container.dart';
import '../widgets/nav_bar.dart';



class DiscoverVue extends StatelessWidget {
  const DiscoverVue({Key? key}) : super(key: key);
  static const routeName ='/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Interview','Mobile','Telecom','Autre'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        /*  leading: IconButton(
            onPressed: (){
            },
            icon: const Icon(Icons.menu,color: Colors.black,),
          ),*/
        ),
        bottomNavigationBar: const NavBar(index: 1),
        // extendBodyBehindAppBar: true,
        body: ListView(padding: const EdgeInsets.all(20.0),
          children: [
            const _DiscoverNews(),
            _Categories(tabs: tabs),
          ],
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    Key? key,required this.tabs,
  }) : super(key: key);
  final  List<String> tabs;
  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs.
          map((tab) => Tab(
            icon: Text(tab,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold
            ),),
          )).toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height ,
          child: TabBarView(children: tabs.map((tab) => ListView.builder(
            shrinkWrap: true,
            itemCount: articles.length,
            itemBuilder: (context,index) {
              return InkWell(
                onTap: (){
                /*  Navigator.pushNamed(
                    context,
                    ArticleEcran.routeName,
                    arguments: articles[index],);*/
                },
                child: Row(
                  children: [
                    ImageContainer(
                        width: 80,
                        heigth:80,
                        margin: const EdgeInsets.all(10.0) ,
                        borderRaidus: 5,
                        imageUrl: articles[index].imageUrl.toString()
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(articles[index].titre.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Icon(
                                Icons.schedule,
                                size: 18,
                              ),
                              SizedBox(width:5),
                              //${DateTime.now().difference(articles[index].publishedAt).inHours}
                              Text('Il y a 12h',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width:20),
                              Icon(
                                Icons.visibility,
                                size: 18,
                              ),
                              SizedBox(width:5),
                              Text('12 vues',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },

          )).toList()),
        )

      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      child: Column(
        //permet de d'aligner le contenu au debut du conteneur
        crossAxisAlignment: CrossAxisAlignment.start,
        //permet de centrer un contenu dans un bloc suivant Y
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Decouverte'
            ,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 5,),
          Text('New from all over the world'
              ,
              style: Theme.of(context).textTheme.bodySmall

          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(hintText: 'Recherche',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color:Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child:  Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none )
            ),
          )
        ],
      ),
    );
  }
}
