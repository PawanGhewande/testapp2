import 'package:flutter/material.dart';
import 'package:testapp2/core/navigation/my_route_delegate.dart';
import 'package:testapp2/core/navigation/my_route_informtion_parser.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('third')),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('go to second'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .configuration = MyRoutes.second;
            },
          )
        ],
      )),
    );
  }
}
