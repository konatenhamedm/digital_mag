
import 'package:get/get.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/services/api_service.dart';
import 'package:get_storage/get_storage.dart';

class PostsController extends GetxController{
  var isLoading= true.obs;
  var postsList = <NewsModele>[].obs;
  var loveListe = <NewsModele>[].obs;
  var carousselData = <NewsModele>[].obs;
  var articleRecentData = <NewsModele>[].obs;
  var box = GetStorage();

 // List<NewsModele> carousselData = [];
  
  @override
  void onInit() {
    // TODO: implement onInit
   // fetchPosts2();
    fetchPosts();
    fetchCaroussel();
    fetchArticlerecents();
    fetchCategorieByArticle();

    if(box.read('carousselData') != null) {
      carousselData.assignAll(box.read("carousselData")) ;
    }
    //print(carousselData);
    super.onInit();
  }
  
  Future<void> fetchPosts({int? categoryId = 4,int pageNumber = 0,int totalRecords = 0}) async{
    try{
     isLoading(true);
     loveListe.clear();
      /*if(loveListe.length == 0 || pageNumber == 0){
       isLoading(true);
        loveListe.clear();
      }*/
      if(loveListe.length < totalRecords){
        var posts = await ApiService.fetchPosts(categoryId!,pageNumber);


        if(posts != null){
          loveListe.addAll(posts);
        }
       // print(postsList);
      }

    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchArticleParCategorie({int? categoryId = 4}) async{
    try{
      isLoading(true);
      var posts = await ApiService.fetchArticleParCategorie(categoryId!);
      postsList.clear();

      if(posts != null){
        postsList.addAll(posts);
      }
    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchCaroussel() async{
    try{
      isLoading(true);
      var posts = await ApiService.fetchCaroussel();
      carousselData.clear();
      //articleRecentData.clear();

      if(posts != null){
        carousselData.addAll(posts);
        //articleRecentData.addAll(posts);
      }
    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchArticlerecents() async{
    try{
      isLoading(true);
      var posts = await ApiService.fetchArticlerecents();
      articleRecentData.clear();
      //articleRecentData.clear();

      if(posts != null){
        articleRecentData.addAll(posts);
        //articleRecentData.addAll(posts);
      }
    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchCategorieByArticle({int? categoryId = 4}) async{
    try{
      isLoading(true);
      var posts = await ApiService.fetchArticleParCategorie(categoryId!);
      postsList.clear();

      if(posts != null){
        postsList.addAll(posts);
      }
    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchPosts2({int pageNumber = 0,int totalRecords = 0}) async{
    try{

      if(postsList.isEmpty || pageNumber == 0){
        isLoading(true);
        postsList.clear();
      }
      if(postsList.length < totalRecords){
        var posts = await ApiService.fetchPosts2(pageNumber);


        if(posts != null){
          postsList.addAll(posts);
          //carousselData.addAll(posts);
        }
        //print(postsList);
      }
    }finally{
    isLoading(false);
     //update(['carousselData']);
     print("dkhkldk");
    }
  }

}