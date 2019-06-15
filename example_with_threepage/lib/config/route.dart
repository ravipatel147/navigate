import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';
import '../main.dart';




/* define your handler here or create new file for handler */

var page1Handler = Handler(
  transactionType: TransactionType.fromBottomCenter,
  pageBuilder: (BuildContext context,arg){
      /* return your page from here */
      return Page1();
  }
);

var page2Handler = Handler(
  transactionType: TransactionType.fromRight,
  pageBuilder: (BuildContext context,arg){
      /* return your page from here */
      return Page2();
  }
);

var page3Handler = Handler(
  transactionType: TransactionType.fromLeft,
  pageBuilder: (BuildContext context,arg ){
      /* return your page from here */
      return Page3();
  }
);


/* define your route here */
Map<String,Handler> route = {
    "page1" :page1Handler,
    "page2" :page2Handler,
    "page3" :page3Handler
 };