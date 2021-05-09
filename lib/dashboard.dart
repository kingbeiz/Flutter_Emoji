import 'dart:ffi';

import 'package:flutter/material.dart';
import 'foodTab.dart';
import 'foodTabRecom.dart';
import 'burgerpage.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<DashBoardPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Void initState() {
    _tabController = new TabController(
      vsync: this,
      length: 4,
    );
  }

  void _bottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (BuildContext context) {
          return new Container(
              padding: new EdgeInsets.all(15),
              child: new ListView(
                physics: new BouncingScrollPhysics(),
                children: [
                  new Center(
                    child: new Column(
                      children: [
                        new Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFFFE7D6A),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  new BoxShadow(
                                      blurRadius: 6,
                                      color: Colors.grey.withOpacity(0.8),
                                      offset: new Offset(0.0, 3.0),
                                      spreadRadius: 4)
                                ]),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Container(
                                    height: 95,
                                    width: 95,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFC6E7FE),
                                        image: new DecorationImage(
                                            image: AssetImage(
                                                'assets/tuxedo.png'))),
                                  )
                                ])),
                        new SizedBox(height: 20),
                        new Text(
                          'IBRAHIM',
                          style: new TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 20,
                              color: Color(0xFFFE7D6A)),
                        ),
                        new Text(
                          'YUSUF ABIODUN',
                          style: new TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 17,
                              color: Color(0xFFFE7D6A)),
                        ),
                      ],
                    ),
                  ),
                  new Container(),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
      physics: new BouncingScrollPhysics(),
      children: <Widget>[
        new Container(
          //Custom AppBar

          padding: new EdgeInsets.all(15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Icon(
                Icons.menu,
                color: Colors.black,
              ),
              new InkWell(
                onTap: _bottomSheet,
                child: new Container(
                  height: 40,
                  width: 40,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        offset: new Offset(0.0, 3.0),
                        spreadRadius: 4.0,
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: new AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ), //top AppBar
        ),

        //Text with google font
        new Container(
          padding: new EdgeInsets.only(left: 15),
          child: new Text(
            'SEARCH FOR',
            style: new TextStyle(
              fontFamily: 'Noto Sans',
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        new Container(
          padding: new EdgeInsets.only(left: 15),
          child: new Text(
            'RECIPE...',
            style: new TextStyle(
              fontFamily: 'Noto Sans',
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        new SizedBox(
          height: 25,
        ),
        new Container(
            padding: new EdgeInsets.only(left: 15, right: 15),
            child: new Container(
              padding: new EdgeInsets.only(left: 5),
              decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: new TextField(
                decoration: new InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        new TextStyle(fontFamily: 'Noto Sans', fontSize: 14),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: new Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            )),
        new SizedBox(height: 20),
        new Container(
          padding: new EdgeInsets.only(left: 15),
          child: new Text(
            'Recommended',
            style: new TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        new SizedBox(height: 15),
        new Container(
          height: 200,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            physics: new BouncingScrollPhysics(),
            children: <Widget>[
              _buildListItem('Hamburger', 'assets/burger.png', '21',
                  Color(0xFFFFE9C6), Color(0xFFDA9551)),
              _buildListItem('Chips', 'assets/fries.png', '15',
                  Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
              _buildListItem('Donut', 'assets/doughnut.png', '15',
                  Color(0xFFD7FADA), Color(0xFF56CC7E)),
              _buildListItem('Popcorn', 'assets/popcorn.png', '10',
                  Color(0xFFFFCCBC), Color(0xFFFF5722))
            ],
          ),
        ),
        new SizedBox(height: 10),
        new Container(
          padding: new EdgeInsets.only(left: 15),
          child: new TabBar(
            physics: new BouncingScrollPhysics(),
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: new TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 16,
                fontWeight: FontWeight.w700),
            unselectedLabelStyle: new TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 12,
                fontWeight: FontWeight.w500),
            tabs: [
              new Tab(child: new Text('FEATURED')),
              new Tab(child: new Text('COMBO')),
              new Tab(child: new Text('FAVOURITES')),
              new Tab(child: new Text('RECOMMENDED')),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height - 450,
          child: new TabBarView(
              controller: _tabController,
              physics: new BouncingScrollPhysics(),
              children: [
                FoodTab(),
                FoodTabRec(),
                FoodTab(),
                FoodTabRec(),
              ]),
        )
      ],
    ));
  }

  Widget _buildListItem(String foodname, String imgPath, String price,
      Color bgColor, Color textColor) {
    return new Container(
      padding: new EdgeInsets.only(left: 15),
      child: new InkWell(
        onTap: () {
          Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BPage(
                  heroTag: foodname,
                  foodName: foodname,
                  pricePerItem: price,
                  imgPath: imgPath,
                ),
              ));
        },
        child: new Container(
            height: 175.0,
            width: 150,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: bgColor),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Hero(
                  tag: foodname,
                  child: new Container(
                    height: 75,
                    width: 75,
                    decoration: new BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: new Center(
                      child: new Image.asset(
                        imgPath,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
                new SizedBox(
                  height: 25,
                ),
                new Text(
                  foodname,
                  style: new TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 17,
                    color: textColor,
                  ),
                ),
                new Text(
                  '\$' + price,
                  style: new TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 17,
                    color: textColor,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
