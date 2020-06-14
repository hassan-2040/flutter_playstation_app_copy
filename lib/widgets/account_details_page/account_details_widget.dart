import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playstationappcopy/helpers/enums.dart';
import 'package:playstationappcopy/helpers/size_config.dart';
import 'package:playstationappcopy/widgets/account_details_page/activities_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/communities_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/followers_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/following_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/friends_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/games_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/overview_page.dart';
import 'package:playstationappcopy/widgets/account_details_page/pop_up_menu_button.dart';

class AccountDetailsWidget extends StatefulWidget {
  @override
  _AccountDetailsWidgetState createState() => _AccountDetailsWidgetState();
}

class _AccountDetailsWidgetState extends State<AccountDetailsWidget>
    with SingleTickerProviderStateMixin {
  double _opacityValue = 0; //using set_state to change opacity of appbar
  bool _allowGestureScrollTabView =
      false; //used to make TabBarView unscrollable with gestures if appbar is not visible
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  _scrollListener() {

    //making sure opacity value remains b/w 0 and 1
    double _tempOpacityValue;
    final _relativeValue = _scrollController.position.pixels /
        _scrollController.position.maxScrollExtent;
    if(_relativeValue < 0) {
      _tempOpacityValue = 0;
    } else if (_relativeValue < 1) {
      _tempOpacityValue = _relativeValue;
    } else {
      _tempOpacityValue = 1;
    }

    //changing opacity value based on scroll position
    setState(() {
      _opacityValue = _tempOpacityValue;
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
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: double.maxFinite,
          color: Colors.white,
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
              if (loadingProgress == null) return image;
              if (loadingProgress != null &&
                  loadingProgress.cumulativeBytesLoaded <
                      loadingProgress.expectedTotalBytes) {
                return Center(child: CircularProgressIndicator());
              } else if (loadingProgress.cumulativeBytesLoaded ==
                  loadingProgress.expectedTotalBytes) {
                return image;
              }
              return image;
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Center(
                child: Text(
                  'Could not load image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.textSizeNormal,
                  ),
                ),
              );
            },
          ),
        ),
        SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 300,
              ),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal,
                          spreadRadius: 40,
                          blurRadius: 60,
                          offset: Offset(0, -20), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(radius: 40,),
                        SizedBox(height: 20,),
                        Text(
                          'Hector Frankenstein',
                          style: TextStyle(
                            fontSize: SizeConfig.textSizeMainHeading,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'frankenstien2040',
                          style: TextStyle(
                            fontSize: SizeConfig.textSizeNormal,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        PopUpMenuButton(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.3),
                            child: Text('Edit Profile', style: TextStyle(fontSize: SizeConfig.textSizeNormal, color: Colors.white,),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                height: SizeConfig.smallDevice ?  SizeConfig.screenHeight - 140 : SizeConfig.screenHeight - 170,
                child: SafeArea(
                  child: TabBarView(
                    controller: _tabController,
                    physics: _allowGestureScrollTabView
                        ? AlwaysScrollableScrollPhysics()
                        : NeverScrollableScrollPhysics(),
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
        Opacity(
          opacity: _opacityValue,
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
                          fontSize: SizeConfig.textSizeNormal,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'frankenstien2040',
                        style: TextStyle(
                          fontSize: SizeConfig.textSizeSmall,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                PopUpMenuButton(
                  child: Icon(
                    FontAwesomeIcons.ellipsisV,
                    color: Colors.white,
                    size: 17,
                  ),
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
