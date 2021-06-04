import 'package:flutter/material.dart';
import 'package:testapp2/screens/second_page/presentation/scroll_position.dart';
import '../../../core/navigation/my_route_delegate.dart';
import '../../../core/navigation/my_route_informtion_parser.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late final ScrollController _controller;
  late final ScrollPositionBloc bloc;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController(keepScrollOffset: true);
    bloc = ScrollPositionBloc();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.animateTo(
          ScrollPositionBloc.lastLocation,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second')),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              child: ListView.builder(
                controller: _controller,
                itemCount: 80,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Index : $index"));
                },
              ),
              onNotification: (ScrollNotification scrollInfo) {
                bloc.scrollSink.add(scrollInfo.metrics.pixels);
                return true;
              },
            ),
          ),
          MaterialButton(
            child: Text('go to third'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .configuration = MyRoutes.third;
            },
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
