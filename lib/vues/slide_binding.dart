import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class SlideBiding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<PostsController>(() => PostsController());
  }
}