import 'package:flutter/material.dart';
import 'package:aflacoins_updated/pages/appbackground.dart';
import 'calculatorinputs.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
               child: DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Text(
                      "About Aflao Coins",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'AbrilFatface-Regular',
                          color: Colors.white),
                    ),
                     Container(
              child: Expanded(
                              child: Center(
                  child:
                  ClipOval(child: getImageAsset1(),)
                ),
              ),)
                  ],
                ),
               decoration: BoxDecoration(color: Colors.grey), ),
            ),
           Container(
                padding: EdgeInsets.all(8.0),
                child: aboutText(),
              ),
              
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Aflao Coins",
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'AbrilFatface-Regular',
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          AppBackground(),
          ListView(
            children: <Widget>[
              CalculatorInputs(),
              // ControllersButtons()
            ],
          ),
          // StackedIcons(),
        ],
      ),
    );
  }
   Widget getImageAsset1(){
    AssetImage assetImage = AssetImage('lib/images/cedislogo2.png');
    Image image = Image(image: assetImage, width: 125, height: 125,);
    return Container(
      child: image, margin: EdgeInsets.all( 20),
    );
  }
  Text aboutText() {
    Text abouttext = Text.rich(TextSpan(children: <TextSpan>[
      TextSpan(
          text:
              "Created with the unique intention of facilitating money conversion at the Aflao Border, ",
          style: TextStyle(fontSize: 15)),
      TextSpan(
          text: "Aflao coins, ",
          style: TextStyle(
            color: Colors.red,
          )),
      TextSpan(
          text:
              "seeks to offer an additional aid and conversion accuracy to anyone trying to convert money in other currencies."),
    ]));
    return abouttext;
  }
  
}
