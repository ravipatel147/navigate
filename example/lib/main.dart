import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

import 'config/route.dart';


void main() => runApp(new MaterialApp(
      home: new LandingPage(),
    ));

class LandingPage extends StatelessWidget {

  LandingPage(){
    Navigate.registerRoutes(
      routes: route,
      defualtTransactionType: TransactionType.fromRight
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator Demo"),),
      body: Center(
        child: new RaisedButton(
          child: Text("Take Demo"),
          onPressed: (){
               Navigate.navigate(context,
                  "home",
                  transactionType:TransactionType.fromBottomRight ,
                  replaceRoute: ReplaceRoute.none,
                  arg: {"transactionType":TransactionType.fromLeft,"replaceRoute":ReplaceRoute.none,"color":Colors.green}
                  );
          },

        ),
      ),
    );
  }
}    

class HomePage extends StatefulWidget {
  TransactionType transactionType;
  ReplaceRoute replaceRoute;
  Color color;

  HomePage({this.transactionType, this.replaceRoute,this.color});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TransactionType transactionType;
  ReplaceRoute replaceRoute;
  Color color;
  Color currentColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionType = widget.transactionType;
    print(transactionType);
    replaceRoute = widget.replaceRoute;
    currentColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Demo"),
      ),
      body: Container(
        color: currentColor,
        child: Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new DropdownButton(
                onChanged: (TransactionType type) {
                  setState(() {
                    transactionType = type;
                  });
                },
                value: transactionType,
                items: [
                  DropdownMenuItem(
                    child: Text("Come  from Left"),
                    value: TransactionType.fromLeft,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Right"),
                    value: TransactionType.fromRight,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Top"),
                    value: TransactionType.fromTop,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Bottom"),
                    value: TransactionType.fromBottom,
                  ),
                 DropdownMenuItem(
                    child: Text("Come  from Bottom Center"),
                    value: TransactionType.fromBottomCenter,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Bottom Left"),
                    value: TransactionType.fromBottomLeft,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Bottom Right"),
                    value: TransactionType.fromBottomRight,
                  ),
                  DropdownMenuItem(
                    child: Text("Come  from Fade in"),
                    value: TransactionType.fadeIn,
                  ),
                ],
              ),
               new DropdownButton(
                onChanged: (ReplaceRoute type) {
                  setState(() {
                       replaceRoute = type;
                  });
                },
                value: replaceRoute,
                items: [
                  DropdownMenuItem(
                    child: Text("Replace none"),
                    value: ReplaceRoute.none,
                  ),
                  DropdownMenuItem(
                    child: Text("Replace itSelf"),
                    value: ReplaceRoute.thisOne,
                  ),
                  DropdownMenuItem(
                    child: Text("Replace all"),
                    value: ReplaceRoute.all,
                  ),
               ],
              ),
                new DropdownButton(
                onChanged: (Color type) {
                  setState(() {
                       color = type;
                  });
                },
                value: color,
                items: [
                  DropdownMenuItem(
                    child: Text("red"),
                    value: Colors.red,
                  ),
                  DropdownMenuItem(
                    child: Text("yellow"),
                    value: Colors.yellow,
                  ),
                  DropdownMenuItem(
                    child: Text("pink"),
                    value: Colors.pink,
                  ),
                   DropdownMenuItem(
                    child: Text("green"),
                    value: Colors.green,
                  ),
               ],
              ),
              RaisedButton(
                child: Text("Navigate route"),
                onPressed: () {
                  Navigate.navigate(context,
                  "home",
                  transactionType: transactionType,
                  replaceRoute: replaceRoute,
                  arg: {"transactionType":transactionType,"replaceRoute":replaceRoute,"color":color}
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
