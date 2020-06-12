import 'package:flutter/material.dart';

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
                      fontSize: 18,
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
          child: Center(
            child: Text('news feed widget posts here'),
          ),
        ),
      ],
    );
  }
}
