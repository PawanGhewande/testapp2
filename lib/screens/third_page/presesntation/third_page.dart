import 'package:flutter/material.dart';
import 'package:testapp2/screens/third_page/domain/notification.dart';
import 'package:testapp2/screens/third_page/presesntation/view_model.dart';
import '../../../core/navigation/my_route_delegate.dart';
import '../../../core/navigation/my_route_informtion_parser.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  final NotificationBLoC bloc = NotificationBLoC();
  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('third')),
      body: Center(
          child: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _titleController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _contentController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    
                      onPressed: () {
                        bloc.notiSink.add(new NotiModel(
                            title: _titleController.text,
                            content: _contentController.text));
                      },
                      child: Text('Send Notification')),
                )
              ],
            ),
          ),
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

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }
}
