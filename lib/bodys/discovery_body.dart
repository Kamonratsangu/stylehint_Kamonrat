import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/show_gridview.dart';
import 'package:flutterstylehint/widget/widget_form.dart';
import 'package:flutterstylehint/widget/widget_icon_button.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

import '../states/display_detail_post.dart';
import '../utility/app_controller.dart';
import '../widget/widget_grid_box.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AppService().readPostForDiscover();
    AppService().readDiscoverModel();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print(
              '### discoveryModel -----> ${appController.discoverModels.length}');
          return appController.discoverPostModels.isEmpty
              ? const SizedBox()
              : ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetForm(
                          marginTop: 0,
                          label: 'Search',
                          changeFunc: (p0) {},
                          prefixWidget: Icon(Icons.search),
                        ),
                        WidgetIconButton(
                          iconData: Icons.photo_camera_outlined,
                          pressFunc: () {},
                        )
                      ],
                    ),
                    const WidgetImage(
                      path: 'images/promotion.jpg',
                    ),
                    WidgetText(
                      data: 'Top Trends',
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WidgetText(
                          data: 'All',
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                        WidgetText(
                          data: 'Outfits',
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                        WidgetText(
                          data: 'People',
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        WidgetText(
                          data: 'Hashtag',
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    ShowGridView(),
                  ],
                );
        });
  }
}
