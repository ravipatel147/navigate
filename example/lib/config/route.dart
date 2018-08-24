import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';
import '../main.dart';




/* define your handler here or create new file for handler */

var homeHandler = Handler(
  transactionType: TransactionType.fromRight,
  pageBuilder: (BuildContext context,arg){

      /* return your page from here */
      return HomePage(replaceRoute: arg["replaceRoute"],transactionType: arg["transactionType"],color: arg["color"],);
  }
);


/* define your route here */
Map<String,Handler> route = {
    "home" : homeHandler
 };