import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/size_config.dart';

class NotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          color: Theme.of(context).primaryColor,
          elevation: 10,
          child: SafeArea(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeLarge,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text('All notifications'),
          ),
        ),
      ],
    );
  }
}
