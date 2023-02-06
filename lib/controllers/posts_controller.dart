
import 'package:get/get.dart';
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:digital_mag/services/api_service.dart';
import 'package:get_storage/get_storage.dart';

class PostsController extends GetxController{
  var isLoading= true.obs;
  var postsList = <NewsModele>[].obs;
  var carousselData = <NewsModele>[].obs;
  var box = GetStorage();

 // List<NewsModele> carousselData = [];
  
  @override
  void onInit() {
    // TODO: implement onInit
    fetchPosts2();
    fetchPosts();
    if(box.read('carousselData') != null) {
      carousselData.assignAll(box.read("carousselData")) ;
    }
    super.onInit();
  }
  
  Future<void> fetchPosts({int? categoryId = 1,int pageNumber = 0,int totalRecords = 0}) async{
    try{
     // isLoading(true);
      if(postsList.isEmpty || pageNumber == 0){
        isLoading(true);
        postsList.clear();
      }
      if(postsList.length < totalRecords){
        var posts = await ApiService.fetchPosts(categoryId!,pageNumber);


        if(posts != null){
          postsList.addAll(posts);
        }
        print(postsList);
      }

    }finally{
      isLoading(false);
    }
  }

  Future<void> fetchArticleParCategorie({int? categoryId = 1}) async{
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
        }
        print(postsList);
      }
    }finally{
    isLoading(false);
     //update(['carousselData']);
     print("dkhkldk");
    }
  }

}