import 'package:flutter/material.dart';
import 'package:flutterstylehint/bodys/follow_page.dart';
import 'package:flutterstylehint/bodys/foryou_page.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/widget_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var titles = <String>['For You', 'Follow'];
  var bodys = <Widget>[const ForyouPage(), const FollowPage()];

  @override
  void initState() {
    super.initState();
    AppService().readCatigory();
    AppService().readDemoModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: titles.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: TabBar(
              tabs: titles
                  .map(
                    (e) => WidgetText(data: e),
                  )
                  .toList(),
              isScrollable: true,
            ),
            body: TabBarView(children: bodys),
          ),
        ),
      ),
    );
  }
}
