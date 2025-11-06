import 'package:flutter/material.dart';

class PadddingExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding示例')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Padding 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PaddingBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class PaddingBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey[300],
        //Padding 是一个基础布局组件，用于在子组件周围添加内边距。
        child: Padding(
          padding: EdgeInsets.all(20.0), // 所有方向添加20像素内边距
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Text('有内边距的容器', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
