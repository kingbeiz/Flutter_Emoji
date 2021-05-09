import 'package:flutter/material.dart';

class BPage extends StatefulWidget {
  String imgPath, foodName, pricePerItem, heroTag;
  BPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});
  @override
  _State createState() => new _State();
}

class _State extends State<BPage> {
  var netPrice = 0.0;
  var amounts = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        physics: new BouncingScrollPhysics(),
        children: <Widget>[
          new Container(
              //custom AppBar
              padding: new EdgeInsets.all(15),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  new Stack(children: <Widget>[
                    new Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    new Container(
                        height: 40,
                        width: 40,
                        decoration: new BoxDecoration(boxShadow: [
                          new BoxShadow(
                              color: Color(0xFFFE7D6A),
                              blurRadius: 6,
                              offset: new Offset(0, 4),
                              spreadRadius: 4),
                        ], color: Color(0xFFFE7D6A), shape: BoxShape.circle),
                        child: new Center(
                            child: new Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ))),
                    //Stacked as a notification
                    new Positioned(
                        top: 1.0,
                        right: 4.0,
                        child: new Container(
                            height: 12,
                            width: 12,
                            decoration: new BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: new Center(
                              child: new Text(amounts.toString(),
                                  style: new TextStyle(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 8,
                                      color: Colors.red)),
                            ))),
                  ]),
                ],
              )),
          new Container(
            padding: new EdgeInsets.only(left: 15),
            child: new Text(
              'SUPER',
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
              widget.foodName.toString().toUpperCase(),
              style: new TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          new SizedBox(height: 40),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Hero(
                  tag: widget.heroTag,
                  child: new Container(
                    height: 200,
                    width: 200,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                    ),
                  )),
              new SizedBox(width: 15.0),
              new Column(
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      new Container(
                        height: 45,
                        width: 40,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              new BoxShadow(
                                  color: Color(0xFFFE7D6A).withOpacity(0.1),
                                  blurRadius: 6,
                                  spreadRadius: 6,
                                  offset: new Offset(5.0, 11.0))
                            ]),
                      ),
                      new Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: new Center(
                            child: new Icon(Icons.favorite_border,
                                size: 25, color: Color(0xFFFE7D6A))),
                      ),
                    ],
                  ),
                  new SizedBox(height: 25),
                  new Stack(children: [
                    new Container(
                      height: 45,
                      width: 40,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 6,
                                offset: new Offset(5.0, 11.0))
                          ]),
                    ),
                    new Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: new Center(
                            child: new Icon(Icons.restore,
                                size: 25, color: Color(0xFFFE7D6A)))),
                  ])
                ],
              ),
            ],
          ),
          new SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                  height: 70,
                  width: 135,
                  padding: new EdgeInsets.only(left: 15),
                  child: new Center(
                    child: new Text(
                      '\$' +
                          (int.parse(widget.pricePerItem) * amounts).toString(),
                      style: new TextStyle(
                          fontFamily: 'Noto Sans',
                          color: Color(0xFF5E6166),
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              new Container(
                height: 60,
                width: 225,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Color(0xFFFE7D6A),
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      height: 40,
                      width: 105,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: new Row(
                        children: <Widget>[
                          new IconButton(
                              icon: new Icon(
                                Icons.remove,
                                color: Color(0xFFFE7D6A),
                                size: 15,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (amounts != 1) {
                                    amounts--;
                                  }
                                });
                              }),
                          new Text(
                            amounts.toString(),
                            style: new TextStyle(color: Color(0xFFFE7D6A)),
                          ),
                          new IconButton(
                              icon: new Icon(Icons.add,
                                  color: Color(0xFFFE7D6A), size: 15),
                              onPressed: () {
                                setState(() => amounts++);
                              })
                        ],
                      ),
                    ),
                    new Text(
                      'Add to Cart',
                      style: new TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Container(
            padding: new EdgeInsets.all(15),
            child: new Text('FEATURED',
                style: new TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          new Container(
            height: 225,
            width: MediaQuery.of(context).size.height,
            child: new ListView(
              physics: new BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [_buildListItem('1'), _buildListItem('2')],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListItem(String ColumnNumber) {
    return new Container(
      padding: new EdgeInsets.all(15),
      child: new Column(
        children: <Widget>[
          if (ColumnNumber == '1')
            _buildColumnItems(
                'assets/cheese.png', 'Sweet Cheese', '11', Color(0xFFFBD6F5)),
          if (ColumnNumber == '1') new SizedBox(height: 15),
          if (ColumnNumber == '1')
            _buildColumnItems(
                'assets/fries.png', 'Delicius Chips', '15', Color(0xFFFBD6F5)),
          if (ColumnNumber == '2')
            _buildColumnItems(
                'assets/hotdog.png', 'HotDog', '20', Color(0xFFFBD6F5)),
          if (ColumnNumber == '2') new SizedBox(height: 15),
          if (ColumnNumber == '2')
            _buildColumnItems(
                'assets/sandwich.png', 'SandWich', '11', Color(0xFFFBD6F5)),
        ],
      ),
    );
  }

  Widget _buildColumnItems(
      String imgpath, String foodname, String price, Color bgcolr) {
    return Row(
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
                    borderRadius: BorderRadius.circular(7), color: bgcolr),
                child: new Center(
                  child: new Image.asset(imgpath, height: 50, width: 50),
                ),
              ),
              new SizedBox(width: 20),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(foodname,
                      style: new TextStyle(
                          fontFamily: 'Nono Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  new Text('\$' + price,
                      style: new TextStyle(
                          fontFamily: 'Nono Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFE7D6A))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
