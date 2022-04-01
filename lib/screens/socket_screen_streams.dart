import 'package:blocLearn/socket_service.dart';
import 'package:flutter/material.dart';

class SocketStream extends StatefulWidget {
  const SocketStream({Key? key}) : super(key: key);

  @override
  State<SocketStream> createState() => _SocketStreamState();
}

class _SocketStreamState extends State<SocketStream> {

  @override
  Widget build(BuildContext context) {

    SocketService.connectSocketChannel();

    return Scaffold(
      appBar: AppBar(title: Text("Socket"),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: StreamBuilder(
            stream: SocketService.channel.stream,
            builder: (context, snapshot){
              return Text(
                snapshot.hasData ? '${snapshot.data}' : "No data",
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
