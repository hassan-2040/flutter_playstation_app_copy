import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/size_config.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'About Me',
            style: TextStyle(fontSize: SizeConfig.textSizeNormal),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'I am a gamer',
            style: TextStyle(fontSize: SizeConfig.textSizeSmall),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              Text(
                'Language:',
                style: TextStyle(
                  fontSize: SizeConfig.textSizeSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'English (United States)',
                style: TextStyle(
                  fontSize: SizeConfig.textSizeSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
