import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playstationappcopy/helpers/enums.dart';
import 'package:playstationappcopy/helpers/selected_widget_stream.dart';
import 'package:playstationappcopy/helpers/size_config.dart';
import 'package:playstationappcopy/widgets/home_button_content.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with TickerProviderStateMixin {
  bool _expandedMenu = false;
  AnimationController _rotateLogoController;
  AnimationController _rotateCrossController;
  Animation<double> _rotateLogoValue;
  Animation<double> _rotateCrossValue;
  SelectedWidget _selectedWidget = SelectedWidget.newsFeed;

  List<String> _temp = [
    'Events',
    'Trophies',
    'Guest Login',
    'Redeem Code',
    'Settings'
  ];

  @override
  void initState() {
    _rotateLogoController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    //tween has this value bcz rotationTransition multiplies animation value with 2 * pi
    _rotateLogoValue =
        Tween(begin: 0.0, end: 5 / (4 * pi)).animate(_rotateLogoController);

    _rotateCrossController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _rotateCrossValue =
        Tween(begin: -5 / (4 * pi), end: 0.0).animate(_rotateCrossController);

    super.initState();
  }

  void _jumpToNewsFeed() {
    streamController.add(SelectedWidget.newsFeed);
    setState(() {
      _selectedWidget = SelectedWidget.newsFeed;
    });
  }

  void _jumpToFriends() {
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
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RawMaterialButton(
                  highlightColor: Colors.transparent,
                  constraints: BoxConstraints(),
                  onPressed: _jumpToNewsFeed,
                  child: Icon(
                    Icons.crop_square,
                    color: _selectedWidget == SelectedWidget.newsFeed
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                RawMaterialButton(
                  constraints: BoxConstraints(),
                  onPressed: _jumpToFriends,
                  child: Icon(
                    Icons.people,
                    color: _selectedWidget == SelectedWidget.friends
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                Container(width: 60, height: 50),
                RawMaterialButton(
                  constraints: BoxConstraints(),
                  onPressed: _jumpToNotifications,
                  child: Icon(
                    Icons.notifications,
                    color: _selectedWidget == SelectedWidget.notifications
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                RawMaterialButton(
                  constraints: BoxConstraints(),
                  onPressed: _jumpToAccountDetails,
                  child: Icon(
                    Icons.person,
                    color: _selectedWidget == SelectedWidget.accountDetails
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: _expandedMenu ? 0 : 8),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: _expandedMenu ? SizeConfig.smallDevice ? SizeConfig.screenHeight * 0.55 : SizeConfig.screenHeight * 0.45 : SizeConfig.smallDevice ? 50 : 60,
              width: _expandedMenu ? double.maxFinite : SizeConfig.smallDevice ? 50 : 60,
              decoration: BoxDecoration(
                shape: _expandedMenu ? BoxShape.rectangle : BoxShape.circle,
                color: _expandedMenu ? Colors.blue[700] : Theme.of(context).primaryColor,
              ),
              child: _expandedMenu ? HomeButtonContent() : null,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.smallDevice ? 10 : 15,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: _expandedMenu
                ? RotationTransition(
                    key: ValueKey('close'),
                    turns: _rotateCrossValue,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _rotateLogoController.reverse();
                        _rotateCrossController.reverse();
                        setState(() {
                          _expandedMenu = !_expandedMenu;
                        });
                      },
                    ),
                  )
                : RotationTransition(
                    key: ValueKey('expand'),
                    turns: _rotateLogoValue,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.playstation,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _rotateLogoController.forward();
                        _rotateCrossController.forward();
                        setState(() {
                          _expandedMenu = !_expandedMenu;
                        });
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
