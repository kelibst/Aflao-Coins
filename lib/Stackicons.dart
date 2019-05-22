import 'package:flutter/material.dart';

class StackedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      Column(
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 120, left: 130),
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[900]
                  ),
                  child: Icon(Icons.face,  color: Colors.white, size: 60,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 100, right: 90),
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[800]
                  ),
                  child: Icon(Icons.credit_card,  color: Colors.white, size: 60,),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink
                  ),
                  child: Icon(Icons.attach_money,  color: Colors.white, size: 60,),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
