import 'package:bloc/bloc.dart';
import 'app.dart';
import 'counter_observer.dart';
import 'package:flutter/widgets.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(const CounterApp()),
        blocObserver: CounterObserver()
  );
}