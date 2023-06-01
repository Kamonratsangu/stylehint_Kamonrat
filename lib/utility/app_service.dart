import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterstylehint/model/announc_model.dart';
import 'package:flutterstylehint/model/catigory_model.dart';
import 'package:flutterstylehint/model/demo_model.dart';
import 'package:flutterstylehint/model/user_model.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../model/post_model.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> readCatigory() async {
    if (appController.catigoryModels.isNotEmpty) {
      appController.catigoryModels.clear();
    }

    FirebaseFirestore.instance.collection('category').get().then((value) {
      for (var element in value.docs) {
        CatigoryModel catigoryModel = CatigoryModel.fromMap(element.data());
        appController.catigoryModels.add(catigoryModel);
      }
    });
  }

  Future<void> readAllAnnouncModel() async {
    if (appController.announceModels.isNotEmpty) {
      appController.announceModels.clear();
    }

    FirebaseFirestore.instance.collection('announcement').get().then((value) {
      for (var element in value.docs) {
        AnnouncModel announcModel = AnnouncModel.fromMap(element.data());
        appController.announceModels.add(announcModel);
      }
    });
  }

  Future<void> readDemoModel() async {
    if (appController.demoModels.isNotEmpty) {
      appController.demoModels.clear();
    }

    FirebaseFirestore.instance.collection('demo').get().then((value) {
      for (var element in value.docs) {
        DemoModel demoModel = DemoModel.fromMap(element.data());
        appController.demoModels.add(demoModel);
      }
    });
  }

  Future<void> readDiscoverModel() async {
    if (appController.discoverModels.isNotEmpty) {
      appController.discoverModels.clear();
    }

    FirebaseFirestore.instance.collection('discover').get().then((value) {
      for (var element in value.docs) {
        DemoModel model = DemoModel.fromMap(element.data());
        appController.discoverModels.add(model);
      }
    });
  }

  Future<void> readPostForDiscover() async {
    if (appController.discoverPostModels.isNotEmpty) {
      appController.discoverPostModels.clear();
      appController.discoverUserModels.clear();
    }

    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        UserModel userModel = UserModel.fromMap(element.data());

        await FirebaseFirestore.instance
            .collection('user')
            .doc(element.id)
            .collection('post')
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            for (var element in value.docs) {
              PostModel postModel = PostModel.fromMap(element.data());
              appController.discoverPostModels.add(postModel);
              appController.discoverUserModels.add(userModel);
            }
          }
        });
      }
    });
  }

  Future<void> readPostForPost() async {
    if (appController.postPostModels.isNotEmpty) {
      appController.postPostModels.clear();
    }

    await FirebaseFirestore.instance
        .collection('user')
        .doc(appController.currentUserModels.last.uid)
        .collection('post')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          PostModel postModel = PostModel.fromMap(element.data());
          appController.postPostModels.add(postModel);
        }
      }
    });
  }

  Future<void> processUploadImage({required String path}) async {
    if (appController.files.isNotEmpty) {
      String nameFile = basename(appController.files.last.path);
      print('nameFile -------> $nameFile');

      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      Reference reference = firebaseStorage.ref().child('$path/$nameFile');
      UploadTask uploadTask = reference.putFile(appController.files.last);

      await uploadTask.whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          String urlImage = value;
          // print('urlImage ---> $urlImage');
          appController.urlImage.value = urlImage;
        });
      });
    }
  }

  String timeStampToString({required Timestamp timestamp}) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    String string = dateFormat.format(timestamp.toDate());
    return string;
  }

  Future<void> processTakePhoto({required ImageSource imageSource}) async {
    if (appController.files.isNotEmpty) {
      appController.files.clear();
    }
    var result = await ImagePicker()
        .pickImage(source: imageSource, maxWidth: 800, maxHeight: 800);
    if (result != null) {
      appController.files.add(File(result.path));
    }
  }

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
