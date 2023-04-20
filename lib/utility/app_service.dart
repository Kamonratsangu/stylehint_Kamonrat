import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstylehint/model/user_model.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:get/get.dart';

class AppService {
  AppController appController = Get.put(AppController());


Future<void> processSignOut() async {
  await FirebaseAuth.instance.signOut().then((value) {
   appController.currentUserModels.clear();
   appController.uidLogin.value = '';
   appController.indexBody.value = 0;
  });
}



  Future<void> findCurrentUserModel() async {
    var user = FirebaseAuth.instance.currentUser;
    appController.uidLogin.value = user!.uid;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(appController.uidLogin.value)
        .get()
        .then((value) {
          UserModel userModel = UserModel.fromMap(value.data()!);
          appController.currentUserModels.add(userModel);
        });
  }
}