import 'package:flutter/material.dart';
import 'package:savefood/restaurant_details/components/title_price_rating.dart';
import 'package:savefood/Constants/constants.dart' as constants;
import 'components/item_image.dart';
import 'components/order_button.dart';

class Restaurant extends StatelessWidget {
  Restaurant({Key key, @required this.officename}) : super(key: key);
  final String officename;

  static String get officeName => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: RestaurantDetail(
          officename: officename,
        ));
  }
}

class RestaurantDetail extends StatelessWidget {
  RestaurantDetail({Key key, @required this.officename}) : super(key: key);
  final String officename;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ItemImage(
        imgSrc: 'assets/images/marmitapng.png',
      ),
      Expanded(
        child: ItemInfo(officename: officename),
      )
    ]);
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key key, @required this.officename}) : super(key: key);
  final String officename;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(children: <Widget>[
        Column(
          children: [
            shopeName(name: officename),
            TitlePriceRating(
              name: officename + ' cheese burger',
              numOfReviews: 24,
              rating: 4,
              price: 15,
              onRatingChanged: (value) {},
            ),
            Text(
              'Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.',
              style: TextStyle(
                height: 1.5,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            // Free space  10% of total height
            OrderButton(
              size: size,
              press: () {},
            ),
            Container(height: 20)
          ],
        )
      ]),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: constants.kTextColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
