import 'package:flutter/material.dart';

class ScaffoldBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('基础 Scaffold 示例'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            '欢迎使用 Scaffold!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}