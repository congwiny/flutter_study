import 'package:flutter/material.dart';

class ProgressIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProgressIndicator 组件示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. LinearProgressIndicator
            const Text(
              '1. LinearProgressIndicator不确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const LinearProgressIndicator(),
            const Divider(height: 32),
            // 2. LinearProgressIndicator确定进度
            const Text(
              '2. LinearProgressIndicator确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(
              value: 0.6,
              // 当前进度值，null 表示不确定进度
              color: Colors.green,
              //进度条颜色
              backgroundColor: Colors.grey[300],
              // 背景条颜色
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              // 进度条颜色
              minHeight: 8, //进度条高度（默认 6.0）
            ),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}
