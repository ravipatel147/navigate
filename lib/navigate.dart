library navigate;

import 'dart:async';
import 'dart:core';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/material.dart';

/* ChangePage type */
class Navigate {
  static final Navigate _instance = Navigate.internal();
  Navigate.internal();
  factory Navigate() => _instance;
  /* defualt Navigate Transactiontype */
  static TransactionType defultTransactionType;
  /* routes information */
  static Map<String, Handler> _appRoutes;

  static Future<dynamic> navigate(BuildContext context, String routeName,
      {arg,
      TransactionType transactionType,
      ReplaceRoute replaceRoute = ReplaceRoute.none}) async {
    if (_appRoutes.containsKey(routeName)) {
      var handler = _appRoutes[routeName];
      return await handler.renderWithAnimation(
          context, arg, transactionType, replaceRoute);
    } else {
      throw ("ROUTE NOT MATCH");
    }
  }

  static registerRoutes(
      {Map<String, Handler> routes,
      TransactionType defualtTransactionType = TransactionType.fromBottom}) {
    _appRoutes = routes;
    defultTransactionType = defualtTransactionType;
  }
}

/* Route ChangePage handler */
class Handler {
  final Function(BuildContext context, dynamic arg) pageBuilder;
  TransactionType transactionType;
  Handler({this.pageBuilder, this.transactionType});

  Future<dynamic> renderWithAnimation(BuildContext context, arg,
      transactionType, ReplaceRoute replaceRoute) async {
    if (replaceRoute == ReplaceRoute.none) {
      return await Navigator.push(
          context,
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return pageBuilder(context, arg);
              },
              transitionsBuilder: pageTransaction(transactionType)));
    } else if (replaceRoute == ReplaceRoute.thisOne) {
      return await Navigator.pushReplacement(
          context,
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return pageBuilder(context, arg);
              },
              transitionsBuilder: pageTransaction(transactionType)));
    } else if (replaceRoute == ReplaceRoute.all) {
      return await Navigator.pushAndRemoveUntil(
          context,
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return pageBuilder(context, arg);
              },
              transitionsBuilder: pageTransaction(transactionType)),
          (Route<dynamic> route) => false);
    }
  }

  pageTransaction(TransactionType comeFromParam) {
    TransactionType pageTras = comeFromParam != null
        ? comeFromParam
        : (this.transactionType != null)
            ? this.transactionType
            : Navigate.defultTransactionType;

    if (pageTras != TransactionType.fadeIn) {
      double x = 0.0;
      double y = 0.0;

      switch (pageTras) {
        case TransactionType.fromBottom:
          y = 1.0;
          break;
<<<<<<< HEAD
        case TransactionType.fromBottom:
          break;
        case TransactionType.fadeIn:
          break;
        case TransactionType.fromBottomCenter:
          break;
         case TransactionType.fromBottomRight:
          break;  
        case TransactionType.fromBottomLeft:
          break;
        case TransactionType.custom:
          break;
=======
>>>>>>> f20518249ad941f940a2b70f577c307918cb44ad
        case TransactionType.fromTop:
          y = -1.0;
          break;
        case TransactionType.fromLeft:
          x = -1.0;
          break;
        case TransactionType.fromRight:
          x = 1.0;
          break;
      }

<<<<<<< HEAD
      if ((x != 0.0 && y == 0.0) || (y != 0.0 && x == 0.0)) {
        return (___, Animation<double> animation, ____, Widget child) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              return new SlideTransition(
                  position: Tween(begin: Offset(x, y), end: Offset(0.0, 0.0))
                      .animate(animation),
                  child: Opacity(opacity: animation.value, child: child));
            },
          );
        };
      } else {
        return (___, Animation<double> animation, ____, Widget child) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              return new ClipOval(
                  // position: Tween(begin: Offset(x, y), end: Offset(0.0, 0.0))
                  //     .animate(animation),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: PageCome(
                      revalPercentage: animation.value, trasType: pageTras),
                  child: Opacity(opacity: animation.value, child: child));
            },
          );
        };
      }
=======
      if((x != 0.0 && y == 0.0) || (y != 0.0 && x==0.0)) {

       return (___, Animation<double> animation, ____, Widget child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
            return new SlideTransition(
              position: Tween(begin: Offset(x, y), end: Offset(0.0, 0.0))
                  .animate(animation),
                child: Opacity(opacity: animation.value,child: child)
            );
          },
        );
      };
      }else {

      return (___, Animation<double> animation, ____, Widget child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
            return new ClipOval(
              // position: Tween(begin: Offset(x, y), end: Offset(0.0, 0.0))
              //     .animate(animation),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              clipper: PageCome(revalPercentage: animation.value,trasType:pageTras),
              child: Opacity(opacity: animation.value,child: child)
              
            );
          },
        );
      };
      }
    
>>>>>>> f20518249ad941f940a2b70f577c307918cb44ad
    } else {
      return (___, Animation<double> animation, ____, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: child,
        );
      };
    }
  }
}

/* Clip Oval Transaction */
class PageCome extends CustomClipper<ui.Rect> {
  final revalPercentage;
  final TransactionType trasType;

<<<<<<< HEAD
  PageCome({this.revalPercentage = 0.7, this.trasType});
  @override
  ui.Rect getClip(ui.Size size) {
    // TODO: implement getClip
    double dx = (trasType == TransactionType.fromBottomRight)
        ? size.width
        : (trasType == TransactionType.fromBottomCenter)
            ? (size.width / 2)
            : 0.0;

    final escpactor = Offset(dx, size.height * 0.9);
    

    double theta = atan(escpactor.dy / escpactor.dx);
    

    final distanceToCover = escpactor.dy / sin(theta);
    

    final radius = distanceToCover * revalPercentage;
    

    final diamerter =
        (radius * ((trasType == TransactionType.fromBottomLeft) ? 3.0 : 2.0));
    

    var rect = ui.Rect.fromLTWH(
        escpactor.dx - radius, escpactor.dy - radius, diamerter, diamerter);
    return rect;
=======
  PageCome({this.revalPercentage = 0.7,this.trasType});
  @override
  ui.Rect getClip(ui.Size size) {
    // TODO: implement getClip
    double dx = (trasType == TransactionType.fromBottomRight) 
                                                              ? size.width
                                                              : (trasType == TransactionType.fromBottomCenter)
                                                                  ? (size.width / 2)
                                                                  : 0.0; 

    final escpactor = Offset(dx , size.height * 0.9);
     print("espactor" + escpactor.toString());

    double theta = atan(escpactor.dy / escpactor.dx);
    print("theta" + theta.toString());
    
    final distanceToCover = escpactor.dy / sin(theta);
    print("distance" + distanceToCover.toString());

    final radius = distanceToCover * revalPercentage;
    print("radius" + radius.toString());

    final diamerter = (radius * ((trasType == TransactionType.fromBottomLeft) ? 3.0 : 2.0));
    print("diamerter" + diamerter.toString());


    var rect = ui.Rect.fromLTWH(
        escpactor.dx - radius, escpactor.dy - radius, diamerter, diamerter);

    print(rect);
    return rect;    
>>>>>>> f20518249ad941f940a2b70f577c307918cb44ad
  }

  @override
  bool shouldReclip(CustomClipper<ui.Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

/* enum of page translation type */
enum TransactionType {
  fromTop,
  fromBottom,
  fromLeft,
  fromRight,
  fadeIn,
  fromBottomCenter,
  fromBottomLeft,
  fromBottomRight,
  custom,
}
/* replacement type enum */
enum ReplaceRoute { thisOne, all, none }
