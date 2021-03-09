import 'package:baby_photo_editor/app/presentation/pages/bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatorKeys,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          border: Border(
            top: BorderSide(width: 0.0, color: Colors.white),
          ),
          activeColor: Colors.blue,
          inactiveColor: Colors.green,
          backgroundColor: Colors.white,
          items: [
            _buildItem(TabItem.home),
            _buildItem(TabItem.favorites),
            _buildItem(TabItem.save),
            _buildItem(TabItem.profile),
            _buildItem(TabItem.more),
          ],
          onTap: (index) => onSelectTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final item = TabItem.values[index];
          return CupertinoTabView(
            navigatorKey: navigatorKeys[item],
            builder: (context) => widgetBuilders[item](context),
          );
        });
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemDataMap().getAllTabs()[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
      ),
      label: itemData.title,
    );
  }
}
