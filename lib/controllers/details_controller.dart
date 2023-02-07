
import 'package:digital_mag/modeles/news_modele.dart';
import 'package:get/get.dart';
import 'package:digital_mag/modeles/categore_modele.dart';
import 'package:digital_mag/services/api_service.dart';
import 'package:get_storage/get_storage.dart';

class DetailsController extends GetxController{
  var isLoading = true.obs;
  var dark = false.obs;
  var favorite = false.obs;
  var postModel = NewsModele().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    // fetchPosts2();
    fetchDetails();

    super.onInit();
    final box = GetStorage();
    dark(box.read("isDarkMode"));
    favorite(box.read("favorite"));
  }

  Future<void> fetchDetails({int? postId}) async{
    try{
      isLoading(true);
      var  postDetails = await ApiService.fetchInfo(postId!);

      if(postDetails != null){

        postModel.value = postDetails;
      }
    }finally{
      isLoading(false);
    }
  }
  void darkMode(){
    dark.toggle();
    final box = GetStorage();
    box.write("isDarkMode", dark.value);
  }
  void favoriteArticle(){
    favorite.toggle();
    final box = GetStorage();
    box.write("favorite", favorite.value);
  }
}