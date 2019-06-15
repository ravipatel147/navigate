import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

import 'config/route.dart';


void main() => runApp(new MaterialApp(
      home: new MainPage(),
    ));

class MainPage extends StatelessWidget {

   MainPage(){
    Navigate.registerRoutes(
      routes: route, /* come form the navigate pakage */
      defualtTransactionType: TransactionType.fromRight  /* come from the navigate package*/ 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Page1();
  }
}    
// page 1
class Page1 extends StatelessWidget {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigate Demo"),),
      backgroundColor: Colors.teal,
      body: Center(
        child: new RaisedButton(
          child: Text("Go to page 2"),
          onPressed: (){

               Navigate.navigate(context,"page2");
          },

        ),
      ),
    );
  }
}

// page 2
class Page2 extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2"),),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: new RaisedButton(
          child: Text("Go to page 3"),
          onPressed: (){
               Navigate.navigate(context,"page3");
          },

        ),
      ),
    );
  }
}    
// page 3
class Page3 extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3"),),
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: new RaisedButton(
          child: Text("Go to page 1"),
          onPressed: (){
               Navigate.navigate(context,"page1",replaceRoute: ReplaceRoute.all);
          },

        ),
      ),
    );
  }
}    
