



import 'dart:async';

import 'package:flutter_bloc_pattern2/counter_event.dart';

class CounterBloc{
  int _counter=0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink; //sink is the
  //input of the stream

  Stream<int> get counter => _counterStateController.stream; // output of the stream


  //get events from ui
  final _counterEventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen((event) {
      if(event is IncrementEvent){
        _counter++;
      }
      else{
        _counter--;
      }
    });

    _inCounter.add(_counter);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }


}