import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../flutter_rating_bar.dart';
import '../utils/AppWidget.dart';
import '../utils/T3widgets.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';


class DemoT3BottomSheet extends StatefulWidget {
  static var tag = "/DemoT3BottomSheet";

  @override
  DemoT3BottomSheetState createState() => DemoT3BottomSheetState();
}

class DemoT3BottomSheetState extends State<DemoT3BottomSheet> {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    scaffoldKey = GlobalKey<ScaffoldState>();
    Future.delayed(Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: t3_white,
          context: context,
          builder: (BuildContext context) {
            return Stack(alignment: Alignment.topRight, children: <Widget>[
              Container(
                height: 180,
                color: appStore.appBarColor,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(t3_lbl_review, style: boldTextStyle(color: t3_colorPrimary, size: 18)),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);
          });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark],
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
            ),
          ),
          T3AppBar(t3_lbl_bottom_sheet),
        ],
      ),
    );
  }
}