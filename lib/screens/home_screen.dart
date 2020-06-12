import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/selected_widget_stream.dart';
import 'package:playstationappcopy/widgets/bottom_navigation_bar_widget.dart';
import 'package:playstationappcopy/widgets/friends_widget.dart';
import 'package:playstationappcopy/widgets/news_feed_widget.dart';

import '../helpers/enums.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/news-feed-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: selectedWidgetStream,
              builder: (ctx, selectedWidgetSnapshot) {
                if(selectedWidgetSnapshot.hasData) {
                    switch (selectedWidgetSnapshot.data) {
                      case SelectedWidget.newsFeed:
                        {
                          return NewsFeedWidget();
                        }
                        break;
                      case SelectedWidget.friends:
                        {
                          return FriendsWidget();
                        }
                        break;
                      case SelectedWidget.notifications:
                        {
                          return Center(child: Text('Notifications'),);
                        }
                        break;
                      case SelectedWidget.accountDetails:
                        {
                          return Center(child: Text('Account details'),);
                        }
                        break;
                      default:
                        {
                          return NewsFeedWidget();
                        }
                    }
                } else {
                  return NewsFeedWidget();
                }
              },
            ),
          ),
          BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}
