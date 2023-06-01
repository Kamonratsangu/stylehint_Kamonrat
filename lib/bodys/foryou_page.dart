import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/widget/show_gridview.dart';
import 'package:flutterstylehint/widget/widget_image_network.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class ForyouPage extends StatelessWidget {
  const ForyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('demoModels --> ${appController.demoModels.length}');
          return appController.demoModels.isEmpty
              ? const SizedBox()
              : ListView(
                  children: [
                    WidgetText(
                      data: 'All',
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: appController.catigoryModels.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              WidgetImageNetwork(
                                urlImage: appController.catigoryModels[index].url,
                                height: 100,
                                boxFit: BoxFit.contain,
                              ),
                              WidgetText(
                                  data: appController.catigoryModels[index].tags)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  data: 'Filter(16)',
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 18),
                                ),
                                Icon(Icons.tune),
                              ],
                            ),
                          ),
                        ),
                       
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  data: 'Sort',
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 18),
                                ),
                                Icon(Icons.swap_vert),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ShowGridView(),
                  ],
                );
        });
  }
}

