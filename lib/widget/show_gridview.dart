import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/widget/widget_image_network.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class ShowGridView extends StatefulWidget {
  const ShowGridView({
    super.key,
  });

  @override
  State<ShowGridView> createState() => _ShowGridViewState();
}

class _ShowGridViewState extends State<ShowGridView> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: appController.demoModels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetImageNetwork(urlImage: appController.demoModels[index].url),
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.grey,
                  ),
                  WidgetText(
                      data: appController.demoModels[index].star.toString()),
                  const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            WidgetText(
              data: appController.demoModels[index].name,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            WidgetText(data: appController.demoModels[index].tags),
          ],
        ),
      ),
    );
  }
}
