import 'package:flutter/material.dart';
import 'package:flutterstylehint/bodys/discovery_body.dart';
import 'package:flutterstylehint/bodys/home_body.dart';
import 'package:flutterstylehint/bodys/notification_body.dart';
import 'package:flutterstylehint/bodys/post_body.dart';
import 'package:flutterstylehint/bodys/profile_body.dart';
import 'package:flutterstylehint/states/authen.dart';
import 'package:flutterstylehint/states/create_new_account.dart';
import 'package:flutterstylehint/states/loginpage.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/utility/app_dialoge.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_text_button.dart';
import 'package:get/get.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'Home',
    'Discover',
    'Post',
    'Notification',
    'Profile',
  ];

  var paths = <String>[
    'images/batman.png',
    'images/batman.png',
    'images/batman.png',
    'images/batman.png',
    'images/batman.png',
  ];
  var pathsActive = <String>[
    'images/account.png',
    'images/account.png',
    'images/account.png',
    'images/account.png',
    'images/account.png',
  ];

  var iconDatas = <IconData>[
    Icons.home,
    Icons.search,
    Icons.add_circle,
    Icons.notifications,
    Icons.person,
  ];

  var items = <BottomNavigationBarItem>[];

  var bodys = <Widget>[
    const HomeBody(),
    const DiscoverBody(),
    const PostBody(),
    const NotificationBody(),
    const ProfileBody(),
  ];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: WidgetImage(
            path: paths[i],size: 24,
          ),
          activeIcon: WidgetImage(path: pathsActive[i],size: 24,),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('currentUserModel = ${appController.currentUserModels.length}');
          return Scaffold(
            body: SafeArea(child: bodys[appController.indexBody.value]),
            bottomNavigationBar: BottomNavigationBar(
              items: items,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                if (value == 2) {
                  //Post
                  if (appController.currentUserModels.isEmpty) {
                    Get.offAll(const LoginPage());
                  } else {
                    appController.indexBody.value = value;
                  }
                } else {
                  appController.indexBody.value = value;
                }

                // if (value == 2 || value == 3 || value == 4) {
                //   if (appController.currentUserModels.isEmpty) {
                //     // Guest
                //     print('Guest');
                //     AppDialog(context: context).normalDialog(
                //         title: 'Login ?',
                //         firstAction: WidgetTextButton(
                //           label: 'Create Account',
                //           pressFunc: () {
                //             Get.back();
                //             Get.to(const CreatenewAccount());
                //           },
                //         ),
                //         secondAction: WidgetTextButton(
                //           label: 'Login',
                //           pressFunc: () {
                //             Get.back();
                //             Get.to(const Authen());
                //           },
                //         ));
                //   } else {
                //     appController.indexBody.value = value;
                //   }
                // } else {
                //   appController.indexBody.value = value;
                // }
              },
              currentIndex: appController.indexBody.value,
            ),
          );
        });
  }
}
