import 'dart:async';

class ScrollPositionBloc {
  final StreamController<double> _scrollStreamController =
      StreamController<double>();

  StreamSink<double> get scrollSink => _scrollStreamController.sink;

  Stream<double> get scrollStram => _scrollStreamController.stream;
  static double lastLocation = 0;
  ScrollPositionBloc() {
    scrollStram.listen((event) {
      lastLocation = event;
    });
  }

  dispose() {
    _scrollStreamController.close();
  }
}
