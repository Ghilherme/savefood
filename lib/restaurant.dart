import 'package:flutter/material.dart';

import 'menu/custom_drawer.dart';

class Restaurant extends StatelessWidget {
  Restaurant({Key key, @required this.officename}) : super(key: key);
  final String officename;

  static String get officeName => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(title: Text('Restaurants')),
        body: Container(
          child: RestaurantDetail(
            officename: officename,
          ),
        ));
  }
}

class RestaurantDetail extends StatefulWidget {
  final String officename;

  RestaurantDetail({Key key, @required this.officename}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  _RestaurantDetailState();
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.officename));
  }
}
