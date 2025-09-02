import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: ElevatedButton(
          child: Text('前往第二页并传值'),
          onPressed: () async {
            // 等待返回结果
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SecondScreen(message: '来自首页的问候', value: 42),
              ),
            );

            // 显示返回的数据
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('返回结果: $result')));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String message;
  final int value;

  SecondScreen({required this.message, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('接收到的消息: $message'),
            Text('接收到的数值: $value'),
            ElevatedButton(
              child: Text('返回并传值'),
              onPressed: () {
                // 返回时传递数据
                Navigator.pop(context, '这是返回的数据');
              },
            ),
          ],
        ),
      ),
    );
  }
}
