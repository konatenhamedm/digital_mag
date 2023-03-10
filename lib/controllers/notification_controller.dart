
import 'package:digital_mag/modeles/notification_modele.dart';
import 'package:get/get.dart';
import 'package:digital_mag/services/api_service.dart';

class NotificationController extends GetxController{

  var isLoading= true.obs;
  var notificationList = <NotificationModele>[].obs;
  @override
  void onInit() {

    fetchNotification();
    super.onInit();

  }
  Future<void> fetchNotification() async{
    try{
      isLoading(true);
      var notifications = await ApiService.fetchNotification();
      notificationList.clear();
      //articleRecentData.clear();

      if(notifications != null){
        notificationList.addAll(notifications);
        //articleRecentData.addAll(posts);
      }
    }finally{
      isLoading(false);
    }
  }


}