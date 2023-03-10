import 'package:digital_mag/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/form-helper.dart';

class PageNotification extends StatefulWidget {
  const PageNotification({Key? key}) : super(key: key);
  //final bool isReload;
  @override
  State<PageNotification> createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification>{

final NotificationController notificationController = Get.put(NotificationController());
var refreshKey = GlobalKey<RefreshIndicatorState>();
ScrollController _scrollController = new ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Digital Mag",style: TextStyle(
              color: Colors.black
          ),),
        ),
      ),
      body: Container(
        child: Obx(() {
    if(notificationController.isLoading.value) {
    return  const Center(
    child: CircularProgressIndicator(),
    );
    }else{
      return RefreshIndicator(
        key: refreshKey,
        onRefresh: () =>  notificationController.fetchNotification(),

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child:ListView.builder(
            itemCount: notificationController.notificationList.length,
            itemBuilder: (BuildContext ctx, index) {
              // Display the list item
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  setState(() {
                    notificationController.notificationList.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vous venez de supprimer une notification')));

                  });
                },
                background: Container(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),

                // Display item's title, price...
                child: GestureDetector(
                  onTap: (){
                    FormHelper.showMessage(
                        context, "Message", notificationController.notificationList[index].title.toString(),
                        "Quitter", (){
                      Navigator.of(context).pop();
                    }) ;
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: ListTile(
                      //visualDensity: VisualDensity(vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xff764abc),
                        child: Text(notificationController.notificationList[index].auteur.toString().substring(0,1)),
                      ),
                      title: Text('Item ${notificationController.notificationList[index].auteur}'),
                      subtitle: Text(notificationController.notificationList[index].title.toString()),
                      trailing: Icon(Icons.arrow_back),
                    ),
                  ),
                )
              );
            },
          ))
        );
    }
        }),
      ),
    );
  }
}
