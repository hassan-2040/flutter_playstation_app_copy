import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstationappcopy/helpers/size_config.dart';

class HomeButtonContent extends StatelessWidget {
  List<String> _firstList = [
    'Events',
    'Trophies',
    'Guest Login',
    'Redeem Code',
    'Settings'
  ];
  List<String> _secondList = [
    'PS Store',
    'PS Plus',
    'Competition Center',
    'Games',
    'Accessories',
    'PS Blog'
  ];

  List<String> _thirdList = [
    'Messages',
    'Communities',
    'Second Screen',
    'PS Video',
  ];

  List<Widget> get getFirstList {
    List<Widget> _widgetList = [];
    _firstList.forEach((element) {
      _widgetList.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: SizeConfig.smallDevice ? 50 : 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                element,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.textSizeSmall,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return _widgetList;
  }

  List<Widget> get getSecondList {
    List<Widget> _widgetList = [];
    _secondList.forEach((element) {
      _widgetList.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: SizeConfig.smallDevice ? 50 : 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.whatshot,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                element,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: SizeConfig.textSizeSmall,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return _widgetList;
  }

  List<Widget> get getThirdList {
    List<Widget> _widgetList = [];
    _thirdList.forEach((element) {
      _widgetList.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: SizeConfig.smallDevice ? 50 : 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.gamepad,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                element,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: SizeConfig.textSizeSmall,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return _widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getFirstList,
            ),
          ),
          SizedBox(
            height: SizeConfig.smallDevice ? 0 : 10,
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: SizeConfig.smallDevice ? 0 : 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getSecondList,
            ),
          ),
          SizedBox(
            height: SizeConfig.smallDevice ? 0 : 10,
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: SizeConfig.smallDevice ? 0 : 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getThirdList,
            ),
          ),
        ],
      ),
    );
  }
}
