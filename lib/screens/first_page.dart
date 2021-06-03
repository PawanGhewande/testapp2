import 'package:flutter/material.dart';
import 'package:testapp2/core/data/shared_data.dart';
import 'package:testapp2/core/navigation/my_route_delegate.dart';
import 'package:testapp2/core/navigation/my_route_informtion_parser.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<bool> _isSelected = [false];
  @override
  Widget build(BuildContext context) {
    isRemembred().then((value) => _isSelected[0] = value);
    return Scaffold(
        appBar: AppBar(title: Text('first')),
        body: Column(
          children: <Widget>[
            Center(
              child: ToggleButtons(
                children: <Widget>[Text('REMEMBER LAST VISITED ROUTE')],
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    _isSelected[index] = !_isSelected[index];
                    setRemember(_isSelected[index]);
                  });
                },
                color: Colors.grey,
                selectedColor: Colors.red,
                fillColor: Colors.lightBlueAccent,
                borderColor: Colors.lightBlueAccent,
                selectedBorderColor: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Center(
              child: MaterialButton(
                child: Text('go to second'),
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .configuration = MyRoutes.second;
                },
              ),
            )
          ],
        ));
  }
}
