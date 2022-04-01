import 'package:blocLearn/screens/socket_screen.dart';
import 'package:blocLearn/screens/socket_screen_streams.dart';
import 'package:blocLearn/screens/timer_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        colorScheme: ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const SocketStream(),
    );
  }
}
