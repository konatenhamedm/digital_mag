
import 'package:get/get.dart';
import 'package:digital_mag/modeles/categore_modele.dart';
import 'package:digital_mag/services/api_service.dart';

class CategoriesController extends GetxController{
  var isLoading= true.obs;
  var categoriesList = <CategorieModele>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    //print(fetchCategories());
    super.onInit();
  }
  Future<void> fetchCategories() async{
    try{
      isLoading(true);
      var categories = await ApiService.fetchCategories();
      // print(categories);
      if(categories!.length! > 0){
         categoriesList.clear();
         categoriesList.addAll(categories);
       }
    }finally{
      isLoading(false);
    }
  }
}