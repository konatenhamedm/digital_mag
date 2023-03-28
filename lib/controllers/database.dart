import 'package:digital_mag/modeles/test_modele.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Database extends GetxController {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void storePriceModel(TestModele model) {
    box.write('model', model.toMap());
  }

  TestModele restoreModel() {
    final map = box.read('model') ?? {};
    return TestModele.fromMap(map);
  }
}