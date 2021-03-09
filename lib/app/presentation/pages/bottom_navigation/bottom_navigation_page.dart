import 'package:baby_photo_editor/app/presentation/pages/bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import 'cuppertino_home_scaffold.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  TabItem _currentTab = TabItem.home;

  @override
  void initState() {
    super.initState();
  }

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.favorites: GlobalKey<NavigatorState>(),
    TabItem.save: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.more: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => Container(),
      TabItem.favorites: (_) => Container(),
      TabItem.save: (_) => Container(),
      TabItem.profile: (_) => Container(),
      TabItem.more: (_) => Container(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    }
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
      navigatorKeys: navigatorKeys,
    );
  }

}
