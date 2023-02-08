

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../modeles/article.dart';
import '../vues/details_page..dart';

class CarrousselSlideData extends StatefulWidget {
  final  List<NewsModele> articles ;
  const CarrousselSlideData(this.articles, {super.key});

  @override
  State<CarrousselSlideData> createState() => _CarrousselSlideDataState();
}

class _CarrousselSlideDataState extends State<CarrousselSlideData> {
  int _current = 0;
  late   List<Widget> imageSlider = [];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageSlider = widget.articles.map((e) => Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (){
          /*Navigator.pushNamed(context,
            DetailsPage.routeName,
            arguments: e,
          );*/
          Get.to(DetailsPage(category_id: e.id,));
        },
        child: ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Stack(
            children: [
              CachedNetworkImage(imageUrl: e.imageUrlBool !=null && e.imageUrlBool == false ?
              e.imageUrl.toString() : "https://lataule.com/wp-content/uploads/2017/11/fond-gris-moyen.jpg",
              errorWidget: (context ,url,error)=>
                const Icon(Icons.error),
                progressIndicatorBuilder: (context,url,downloadProgress)=>
                 Center(
                   child: CircularProgressIndicator(

                     value: downloadProgress.progress,
                   ),
                 ),
                fit: BoxFit.cover,
                width: 1000,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                   padding: const EdgeInsets.all(10),
                  child:   Column(
                   children : [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Container(
                         padding: const EdgeInsets.all(7),
                         margin: const EdgeInsets.all(10),
                         decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.circular(15)
                         ),
                         child: Text(e.categoryName.toString()
                           ,style: const TextStyle(
                               color: Colors.white,
                               fontSize: 5,
                               fontWeight: FontWeight.bold
                           ),),
                       ),
                     ),
                     Text(
                       e.title.toString(),
                       style: const TextStyle(
                           color: Colors.red,
                           fontSize: 11,
                           fontWeight: FontWeight.bold
                       ),
                     ),
                    const SizedBox(height: 2,),
                     Row(
                       children: [
                         Align(
                           alignment: Alignment.topLeft,
                           child: Container(
                             padding: const EdgeInsets.all(7),
                             margin: const EdgeInsets.all(10),
                             decoration: BoxDecoration(
                                 color: Colors.grey,
                                 borderRadius: BorderRadius.circular(15)
                             ),
                             child:  Text("Ecrit par : ${e.auteur.toString()}"
                               ,style:  const TextStyle(
                                 color: Colors.white,
                                 fontSize: 5,

                               ),),
                           ),
                         ),
                         const SizedBox(width: 1,),
                         Align(
                           //alignment: Alignment.topLeft,
                           child: Container(
                             padding: const EdgeInsets.all(7),
                             //margin: const EdgeInsets.all(7),
                             decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(15)
                             ),
                             child:  Text("publié il y a ${DateTime.now().difference(DateFormat('dd-MMM-yyyy').parse(e.postedDate.toString())).inHours} heure(s)"
                               ,style:  const TextStyle(
                                 color: Colors.white,
                                 fontSize: 5,

                               ),),
                           ),
                         ),
                       ],
                     )
                   ]
                  )
                ),
              )
            ],
          ),
        ),
      ),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  setState(() {
                    _current = index;
                  });
                }
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.widget.articles.map((e) {
              int index = widget.articles.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ?  Color.fromRGBO(0, 0, 0, 0.9)
                      :  Colors.purple
                ),
            );
            }).toList(),
          )
        ],
      ),
    );
  }
}
