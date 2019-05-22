import 'package:flutter/material.dart';

class CalculatorInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[

            getImageAsset(),
            GetInputs()

          ],
        ),
      ),
    );
  }
  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('lib/images/cedislogo2.png');
    Image image = Image(image: assetImage, width: 125, height: 125,);
    return Container(
      child: image, margin: EdgeInsets.all( 20),
    );
  }
}
class GetInputs extends StatefulWidget {
  @override
  _GetInputsState createState() => _GetInputsState();
}

class _GetInputsState extends State<GetInputs> {
  var _currencies = ['Cedis', 'Cfa', 'Naira', 'Dollar'];
  var _currencies1 = ['Cedis', 'Cfa', 'Naira', 'Dollar'];
  var _currentItemSelected = "Cedis";
  var _currentItemSelected1 = "Cfa";
  TextEditingController _amountControl =TextEditingController();
  TextEditingController _rateControl =TextEditingController();
  var displayresulted = "";

  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _amountControl,
                        validator: (value){
                          if(value.isEmpty){
                            return "Wrong amount";
                          }

        },
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 15),
                          labelText: "Amount",
                          labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                          hintText: "to be converted",
                          hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0)
                          )
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                          items: _currencies.map((String value){
                            return DropdownMenuItem<String>(
                            value:  value,
                            child: Text(value));
        }).toList(),
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected){
                            _onDropDownItemSelected(newValueSelected);
                          }),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _rateControl,
                          validator: (value){
                            if(value.isEmpty){
                              return "Wrong Rate";
                            }
                          },
                          style: TextStyle(fontSize: 25.0),
                          decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 15),
                              labelText: "Rate",
                              labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                              hintText: "E.g 9.4",
                              hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0)
                              )
                          ),

                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                            items: _currencies1.map((String value){
                              return DropdownMenuItem<String>(
                                  value:  value,
                                  child: Text(value));
                            }).toList(),
                            value: _currentItemSelected1,
                            onChanged: (String newValueSelected){
                              _onDropDownItemSelected1(newValueSelected);
                            }),
                      ),
                    )

                  ],
                ),
              ),
              //Raised buttons go here
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Convert"),
                        onPressed: (){
                            setState(() {
                              if(_formKey.currentState.validate()){
                                this.displayresulted = convNow();
                              }
                              AlertDialog dialog = AlertDialog(
                                  content: Text(
                                    this.displayresulted = convNow(),
                                    textScaleFactor: 2.5,
                                    textAlign: TextAlign.center,
                                  ));
                              showDialog(context: context, builder: (_) => dialog);
                            });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Reset"),
                        onPressed: (){
                          setState(() {
                            _reset();
                          });
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  _onDropDownItemSelected(newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
  _onDropDownItemSelected1(newValueSelected){
    setState(() {
      this._currentItemSelected1 = newValueSelected;
    });
  }

 String convNow(){
    double amount = double.tryParse(_amountControl.text);
    if(amount == null){
      return "Amount should be a number";
    }
      double rate = double.tryParse(_rateControl.text);
      if(rate == null){
      return "Rate should be a number";
    }
      var case1 = _currentItemSelected == _currencies[0];
      var case2 = _currentItemSelected1 == _currencies[1];
      var case3 = _currentItemSelected == _currencies[1];
      var case4 = _currentItemSelected1 == _currencies[0];
      if (case1 && case2) {
        double convertresulted = amount / rate;
        String newNum = convertresulted.toStringAsFixed(3);
        String resulted = "$_currentItemSelected1 : $newNum  ";
        return resulted;
      }
      if (case3 && case4) {
        double convertresulted = amount * rate;
        String newNum = convertresulted.toStringAsFixed(3);
        String resulted1 = "$_currentItemSelected1 : $newNum  ";
        return resulted1;
      } else {
        return "We are currently only converting Cedis and Cfa or vise-versa only.";
      }

 }
 _reset(){
   _amountControl.text = "";
   _rateControl.text = "9.4";
   this.displayresulted = "Result";
   _currentItemSelected1 = _currencies1[1];
 }

}


