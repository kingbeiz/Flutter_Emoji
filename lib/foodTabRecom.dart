import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTabRec extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<FoodTabRec> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          _buildTabItemsRec('Hamburger', 4.5, '21', 'assets/burger.png'),
          _buildTabItemsRec('Chips', 3.5, '15', 'assets/fries.png'),
          _buildTabItemsRec('Donut', 5.0, '25', 'assets/doughnut.png'),
          _buildTabItemsRec('Popcorn', 5.0, '10', 'assets/popcorn.png'),
        ],
      ),
    );
  }

  Widget _buildTabItemsRec(
      String foodName, double rating, String price, String imgPath) {
    return new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            width: 210,
            child: new Row(
              children: <Widget>[
                new Container(
                    height: 75,
                    width: 75,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFFFE3DF)),
                    child: new Center(
                      child: new Image.asset(
                        imgPath,
                        height: 50,
                        width: 50,
                      ),
                    )),
                new SizedBox(
                  width: 20,
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(foodName,
                        style: new TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    new SmoothStarRating(
                        allowHalfRating: false,
                        starCount: rating.toInt(),
                        rating: rating,
                        color: Color(0XFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 15,
                        spacing: 0),
                    new Row(
                      children: <Widget>[
                        new Text(
                          '\$' + price,
                          style: new TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF68D7F)),
                        ),
                        new SizedBox(width: 3),
                        new Text(
                          '\$' + '18',
                          style: new TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.4)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          new FloatingActionButton(
            onPressed: () {},
            heroTag: foodName,
            mini: true,
            child: new Center(
                child: new Icon(
              Icons.favorite_border,
              color: Colors.white,
            )),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ],
      ),
    );
  }
}
