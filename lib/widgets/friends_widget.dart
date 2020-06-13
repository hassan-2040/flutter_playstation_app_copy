import 'package:flutter/material.dart';
import 'package:playstationappcopy/helpers/size_config.dart';

class FriendsWidget extends StatefulWidget {
  @override
  _FriendsWidgetState createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          color: Theme.of(context).primaryColor,
          elevation: 10,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        'Friends',
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
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Following',
                    ),
                    Tab(
                      text: 'Requests',
                    ),
                    Tab(
                      text: 'Players met',
                    ),
                    Tab(
                      text: 'Players you may know',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: Text('All Friends'),
              ),
              Center(
                child: Text('Following Friends'),
              ),
              Center(
                child: Text('Friends Requests'),
              ),
              Center(
                child: Text('Players met online'),
              ),
              Center(
                child: Text('Friends you may know'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
