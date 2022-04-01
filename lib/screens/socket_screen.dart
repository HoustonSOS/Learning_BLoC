import 'package:blocLearn/socket_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var response = "No data";

  _initSocketService() {

    SocketService.connectSocketChannel();

    SocketService.channel.stream.listen((data) {
      setState(() {
        response = data.toString();
      });
    },
      onError: (error) {
        setState(() {
          response = error.toString();
        });
      }
    );
  }

  @override
  void initState() {
    super.initState();
    _initSocketService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Socket"),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            response,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SocketService.closeSocketChannel();
    super.dispose();
  }
}
