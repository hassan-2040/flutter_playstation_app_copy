import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/enums.dart';
import 'package:playstationappcopy/helpers/size_config.dart';



class PopUpMenuButton extends StatelessWidget {
  final Widget child;
  PopUpMenuButton({@required this.child});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "Show Options",
      onSelected: (selectedPopUpValue) {
        switch (selectedPopUpValue) {
          case ProfilePopUpMenuItems.changeProfilePicture:
            {}
            break;
          case ProfilePopUpMenuItems.changeAvatar:
            {
              //
            }
            break;
          case ProfilePopUpMenuItems.changeBackground:
            {
              //
            }
            break;
          case ProfilePopUpMenuItems.privacySettings:
            {
              //
            }
            break;
          case ProfilePopUpMenuItems.moreProfileSettings:
            {
              //
            }
            break;
          default:
            {
              return;
            }
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: child,
      ),
      itemBuilder: (context) {
        return <PopupMenuItem>[
          PopupMenuItem(
            value: ProfilePopUpMenuItems.changeProfilePicture,
            textStyle: TextStyle(
              fontSize: SizeConfig.textSizeSmall,
              color: Colors.black,
            ),
            child: Text('Change Profile Picture'),
          ),
          PopupMenuItem(
            value: ProfilePopUpMenuItems.changeAvatar,
            textStyle: TextStyle(
              fontSize: SizeConfig.textSizeSmall,
              color: Colors.black,
            ),
            child: Text('Change Avatar'),
          ),
          PopupMenuItem(
            value: ProfilePopUpMenuItems.changeBackground,
            textStyle: TextStyle(
              fontSize: SizeConfig.textSizeSmall,
              color: Colors.black,
            ),
            child: Text('Change Background'),
          ),
          PopupMenuItem(
            value: ProfilePopUpMenuItems.privacySettings,
            textStyle: TextStyle(
              fontSize: SizeConfig.textSizeSmall,
              color: Colors.black,
            ),
            child: Text('Privacy Settings'),
          ),
          PopupMenuItem(
            value: ProfilePopUpMenuItems.moreProfileSettings,
            textStyle: TextStyle(
              fontSize: SizeConfig.textSizeSmall,
              color: Colors.black,
            ),
            child: Text('More Profile Settings'),
          ),
        ];
      },
    );
  }
}
