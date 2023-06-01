import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return appController.announceModels.isEmpty
          ? const SizedBox()
          : ListView.builder(
              itemCount: appController.announceModels.length,
              itemBuilder: (context, index) =>
                  Column(
                    children: [
                      WidgetText(data: appController.announceModels[index].noti),
                       Divider(color: Colors.grey.shade300,)
                    ],
                  ),
            );
    });
  }
}
