import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';
import 'package:testpackage/config/route.dart';

void main() => runApp(new MaterialApp(
      home: new LandingPage(),
    ));

class LandingPage extends StatelessWidget {

  LandingPage(){
    Navigate.registerRoutes(
      routes: route,
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
                  transactionType:TransactionType.fromLeft ,
                  replaceRoute: ReplaceRoute.thisOne,
                  arg: {"transactionType":TransactionType.fromLeft,"replaceRoute":ReplaceRoute.thisOne}
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

  HomePage({this.transactionType, this.replaceRoute});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TransactionType transactionType;
  ReplaceRoute replaceRoute;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionType = widget.transactionType;
    replaceRoute = widget.replaceRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Demo"),
      ),
      body: Container(
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
                    child: Text("Come from Left"),
                    value: TransactionType.fromLeft,
                  ),
                  DropdownMenuItem(
                    child: Text("Come from Right"),
                    value: TransactionType.fromRight,
                  ),
                  DropdownMenuItem(
                    child: Text("Come from Top"),
                    value: TransactionType.fromTop,
                  ),
                  DropdownMenuItem(
                    child: Text("Come from Bottom"),
                    value: TransactionType.fromBottom,
                  ),
                  DropdownMenuItem(
                    child: Text("Come from Fade in"),
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
              RaisedButton(
                child: Text("Navigate route"),
                onPressed: () {
                  Navigate.navigate(context,
                  "home",
                  transactionType: transactionType,
                  replaceRoute: replaceRoute,
                  arg: {"transactionType":transactionType,"replaceRoute":replaceRoute}
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
