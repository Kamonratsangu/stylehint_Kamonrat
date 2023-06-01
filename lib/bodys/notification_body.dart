import 'package:flutter/material.dart';
import 'package:flutterstylehint/bodys/activity_page.dart';
import 'package:flutterstylehint/bodys/announcement_page.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/widget_text.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  var titles = <String>['Activity', 'Announcement'];
  var bodys = <Widget>[const ActivityPage(), const AnnouncementPage()];

  @override
  void initState() {
    super.initState();
    AppService().readAllAnnouncModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const WidgetText(data: 'Notification'),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            appBar:
                TabBar(tabs: titles.map((e) => WidgetText(data: e)).toList()),
            body: TabBarView(children: bodys),
          ),
        ),
      ),
    );
  }
}
