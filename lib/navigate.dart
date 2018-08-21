library navigate;


import 'dart:core';
import 'package:flutter/material.dart';

/* navigation type */
class Navigate {

  static final Navigate _instance = Navigate.internal();
  Navigate.internal();
  factory Navigate() => _instance;
  /* defualt navigation Transactiontype */
  static TransactionType defultTransactionType =  TransactionType.fromBottom;
  /* routes information */
  static Map<String,Handler> appRoutes ;

  Navigate.navigate(BuildContext context,String routeName,arg,[TransactionType transactionType]){

    if(appRoutes.containsKey(routeName)) {

      var handler = appRoutes[routeName];
      handler.renderWithAnimation(context,arg,transactionType);
    }
  }

  registerRoutes(Map<String,Handler> routes) {

    appRoutes = routes;
  }
}

/* Route navigation handler */
class Handler {

  final  Function(BuildContext context,dynamic arg) pageBuilder;
  TransactionType transactionType;
  Handler({this.pageBuilder,this.transactionType});

  renderWithAnimation(BuildContext context, arg ,transactionType){
    Navigator.push(
        context,
        new PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return pageBuilder(context,arg);
            },
            transitionsBuilder: PageTransaction(transactionType)));
  }

  PageTransaction(TransactionType comeFromParam) {

     TransactionType pageTras = comeFromParam != null
                                                      ? comeFromParam
                                                      : (this.transactionType != null) ? this.transactionType : Navigate.defultTransactionType;

     if(pageTras != TransactionType.fadeIn) {
        double x = 0.0;
        double y = 0.0;

        switch(pageTras){

          case TransactionType.fromBottom: y = 1.0;
                                            break;
        }

        return (___, Animation<double> animation, ____, Widget child) {
          return new SlideTransition(
            position: Tween(
               begin: Offset(x, y),
               end:Offset(0.0,0.0)
            ).animate(animation),
            child: child,
          );
        };

     }else {
        return (___, Animation<double> animation, ____, Widget child) {
         return new FadeTransition(
           opacity: animation,
           child: child,
         );
       };
     }
    }
}

/* enum of page translation type */
enum TransactionType {
  fromTop,
  fromBottom,
  fromLeft,
  fromRight,
  fadeIn,
  custom,
}