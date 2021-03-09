import 'package:baby_photo_editor/app/constants/string_constants.dart';
import 'package:flutter/material.dart';

class TabItemData {
  TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;
}

enum TabItem {
  home,
  favorites,
  save,
  profile,
  more,
}

class TabItemDataMap {

  Map<TabItem, TabItemData> getAllTabs() {
    return {
      TabItem.home: TabItemData(title: home, icon: Icons.home),
      TabItem.favorites: TabItemData(title: favorites, icon: Icons.star),
      TabItem.save: TabItemData(title: save, icon: Icons.save),
      TabItem.profile: TabItemData(title: profile, icon: Icons.person),
      TabItem.more: TabItemData(title: home, icon: Icons.more_vert),
    };
  }
}
