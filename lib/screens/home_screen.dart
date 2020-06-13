import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/selected_widget_stream.dart';
import 'package:playstationappcopy/widgets/account_details_page/account_details_widget.dart';
import 'package:playstationappcopy/widgets/bottom_navigation_bar_widget.dart';
import 'package:playstationappcopy/widgets/friends_widget.dart';
import 'package:playstationappcopy/widgets/news_feed_widget.dart';
import 'package:playstationappcopy/widgets/notifications_widget.dart';

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
                          return NotificationsWidget();
                        }
                        break;
                      case SelectedWidget.accountDetails:
                        {
                          return AccountDetailsWidget();
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
