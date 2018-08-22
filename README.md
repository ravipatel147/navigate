# navigate

A new Flutter package for Byutifull navigation

# Why develop this package

A flutter have a package name a fluro. Fluro is a nice package and easy to use but they have some limitation. If i need to pass a parameter in Map, List type variable that not allow me. Fluro allow only string but in real time that's not good.

App development its diff from web development in web development we need to pass only small amount of data like id, slug or etc but in App development we need to pass data  between screen is object , array or etc.

## Getting Started

Step 1: install navigator  <br />
``` navigator: 0.0.4 ```

Step 2: Create new folder ``lib\config``  <br />
Step 2: Create file in folder ``lib\config\route.dart`` <br />

```
import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';
import 'package:testpackage/main.dart';



/* define your handler here or create new file for handler */

var homeHandler = Handler(
  transactionType: TransactionType.fromRight,
  pageBuilder: (BuildContext context,arg){

      /* return your page from here */
      return HomePage(replaceRoute: arg["replaceRoute"],transactionType: arg["transactionType"],);
  }
);


/* define your route here */
Map<String,Handler> route = {
    "home" : homeHandler
 };
```
<br />
Work of above code is create one route name ```home```. Route have their own handler called  ```homeHandler```. You can define TransactionType of slide how come on screen. Its not compansary if it null then Defualt transaction is work





