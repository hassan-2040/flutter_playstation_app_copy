import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/size_config.dart';

class NewsFeedWidget extends StatelessWidget {
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
                Expanded(
                  child: Text(
                    'What\'s New',
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeLarge,
                      color: Colors.white,
                    ),
                  ),
                ),
                Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    highlightColor: Theme.of(context).primaryColor,
                    onTap: () {},
                    child: Ink(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.mode_edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Text('news feed widget posts here'),
        ),
      ],
    );
  }
}
