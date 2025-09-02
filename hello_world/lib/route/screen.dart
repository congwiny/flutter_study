import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: ElevatedButton(
          child: Text('前往第二页'),
          onPressed: () {
            // 基本路由跳转
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二页')),
      body: Center(
        child: ElevatedButton(
          child: Text('返回'),
          onPressed: () {
            // 返回上一页
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
