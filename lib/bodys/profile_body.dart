import 'package:flutter/material.dart';
import 'package:flutterstylehint/states/loginpage.dart';
import 'package:flutterstylehint/utility/app_dialoge.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/widget_button.dart';
import 'package:flutterstylehint/widget/widget_icon_button.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [methodSignOut(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WidgetImage(
                  path: 'images/profile.png',
                  size: 70,
                ),
                const SizedBox(width: 8,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WidgetText(
                      data: 'User Profile',
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    WidgetText(
                      data: '@styleabc',
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            WidgetText(data: 'AAA BBBBB CCCCC'),
            WidgetText(data: 'Log AAAA BBBB AAA BBBBB CCCCC'),
            const SizedBox(
              height: 16,
            ),
            WidgetText(data: '0 Follower  0 Followeing'),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: WidgetButton(
                label: 'Login Or SignUp',
                pressFunc: () {
                  Get.offAll(const LoginPage());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  WidgetIconButton methodSignOut(BuildContext context) {
    return WidgetIconButton(
      iconData: Icons.settings_outlined,
      pressFunc: () {
        AppDialog(context: context).normalDialog(
          title: 'SignOut ?',
          subTitle: 'Please Confirm SignOut',
          firstAction: WidgetButton(
            label: 'SignOut',
            pressFunc: () {
              Get.back;
              AppService().processSignOut();
            },
          ),
        );
      },
    );
  }
}
