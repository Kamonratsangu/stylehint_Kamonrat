import 'package:flutter/material.dart';
import 'package:flutterstylehint/states/loginpage.dart';
import 'package:flutterstylehint/widget/widget_button.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class FollowPage extends StatelessWidget {
  const FollowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        children: [
          const WidgetImage(
            path: 'images/profile.png',
            size: 120,
          ),
          WidgetText(
            data: 'AAA bbb ccc AAA bbb ccc AAA bbb ccc',
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          WidgetText(
            data: 'AAA bbb ccc AAA bbb ccc',
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          Container(
            width: double.infinity,
            child: WidgetButton(
              label: 'Log in or Sign Up',
              pressFunc: () {
                Get.offAll(const LoginPage());
              },
            ),
          )
        ],
      ),
    );
  }
}
