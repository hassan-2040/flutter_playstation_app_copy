import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playstationappcopy/helpers/enums.dart';
import 'package:playstationappcopy/widgets/account_details_page/activities_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/communities_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/followers_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/following_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/friends_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/games_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/overview_page.dart';

class AccountDetailsWidget extends StatefulWidget {
  @override
  _AccountDetailsWidgetState createState() => _AccountDetailsWidgetState();
}

class _AccountDetailsWidgetState extends State<AccountDetailsWidget>
    with SingleTickerProviderStateMixin {
  double _opacityValue = 0;
  bool _allowGestureScrollTabView = false;
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  _scrollListener() {
    print("scroll physics: ${_scrollController.position.physics}");
    final _scrollDirection = _scrollController.position.userScrollDirection;
    setState(() {
      _opacityValue = _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
    });
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _allowGestureScrollTabView = true;
      });
      //reached the bottom
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _allowGestureScrollTabView = false;
      });
      //reached the top
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: double.maxFinite,
          color: Colors.purple,
          child: Image.network(
            'https://images.unsplash.com/photo-1591879647848-598422afbc6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1879&q=80',
            fit: BoxFit.cover,
            frameBuilder: (
              BuildContext context,
              Widget image,
              int frame,
              bool wasSynchronouslyLoaded,
            ) {
              return AnimatedOpacity(
                child: image,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              );
            },
            loadingBuilder: (
              BuildContext context,
              Widget image,
              ImageChunkEvent loadingProgress,
            ) {
              print('inside loading builder');
              if (loadingProgress == null) return image;
              if (loadingProgress != null &&
                  loadingProgress.cumulativeBytesLoaded <
                      loadingProgress.expectedTotalBytes) {
                print('still loading');
                return Center(child: CircularProgressIndicator());
              } else if (loadingProgress.cumulativeBytesLoaded ==
                  loadingProgress.expectedTotalBytes) {
                print('loading done');
                return image;
              }
              print('bahar ka print');
              return image;
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Text(
                'Could not load image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8,
                ),
              );
            },
          ),
        ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 300,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.black, boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 40,
                    blurRadius: 60,
                    offset: Offset(0, -20), // changes position of shadow
                  ),
                ]),
              ),
              Container(
                color: Colors.white,
                height: deviceHeight - 170,
                child: SafeArea(
                  child: TabBarView(
                    controller: _tabController,
                    physics: _allowGestureScrollTabView ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                    children: [
                      OverviewPage(),
                      GamesPage(),
                      ActivitiesPage(),
                      FriendsPage(),
                      FollowingPage(),
                      FollowersPage(),
                      CommunitiesPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _opacityValue,
          duration: Duration(milliseconds: 200),
          child: AccountDetailsAppBar(tabController: _tabController),
        ),
      ],
    );
  }
}

class AccountDetailsAppBar extends StatelessWidget {
  final TabController tabController;
  AccountDetailsAppBar({@required this.tabController});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      elevation: 10,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hector Frankenstien',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'frankenstien2040',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
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
                    child: Icon(
                      FontAwesomeIcons.ellipsisV,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                  itemBuilder: (context) {
                    return <PopupMenuItem>[
                      PopupMenuItem(
                        value: ProfilePopUpMenuItems.changeProfilePicture,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        child: Text('Change Profile Picture'),
                      ),
                      PopupMenuItem(
                        value: ProfilePopUpMenuItems.changeAvatar,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        child: Text('Change Avatar'),
                      ),
                      PopupMenuItem(
                        value: ProfilePopUpMenuItems.changeBackground,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        child: Text('Change Background'),
                      ),
                      PopupMenuItem(
                        value: ProfilePopUpMenuItems.privacySettings,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        child: Text('Privacy Settings'),
                      ),
                      PopupMenuItem(
                        value: ProfilePopUpMenuItems.moreProfileSettings,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        child: Text('More Profile Settings'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Overview',
                ),
                Tab(
                  text: 'Games',
                ),
                Tab(
                  text: 'Activities',
                ),
                Tab(
                  text: 'Friends',
                ),
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'Followers',
                ),
                Tab(
                  text: 'Communities',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}