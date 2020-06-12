import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/enums.dart';
import 'package:playstationappcopy/helpers/selected_widget_stream.dart';


class BottomNavigationBarWidget extends StatefulWidget {

  
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  SelectedWidget _selectedWidget = SelectedWidget.newsFeed;

  void _jumpToNewsFeed() {
    streamController.add(SelectedWidget.newsFeed);
    setState(() {
      _selectedWidget = SelectedWidget.newsFeed;
    });
  }

  void _jumpToFriends(){
    streamController.add(SelectedWidget.friends);
    setState(() {
      _selectedWidget = SelectedWidget.friends;
    });
  }

  void _jumpToNotifications() {
    streamController.add(SelectedWidget.notifications);
    setState(() {
      _selectedWidget = SelectedWidget.notifications;
    });
  }

  void _jumpToAccountDetails() {
    streamController.add(SelectedWidget.accountDetails);
    setState(() {
      _selectedWidget = SelectedWidget.accountDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RawMaterialButton(
          highlightColor: Colors.transparent,
          constraints: BoxConstraints(),
          onPressed: _jumpToNewsFeed,
          child: Icon(
            Icons.crop_square,
            color: _selectedWidget == SelectedWidget.newsFeed ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
        RawMaterialButton(
          constraints: BoxConstraints(),
          onPressed: _jumpToFriends,
          child: Icon(
            Icons.people,
            color: _selectedWidget == SelectedWidget.friends ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
        RawMaterialButton(
          constraints: BoxConstraints(),
          onPressed: _jumpToNotifications,
          child: Icon(
            Icons.notifications,
            color: _selectedWidget == SelectedWidget.notifications ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
        RawMaterialButton(
          constraints: BoxConstraints(),
          onPressed: _jumpToAccountDetails,
          child: Icon(
            Icons.person,
            color: _selectedWidget == SelectedWidget.accountDetails ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
