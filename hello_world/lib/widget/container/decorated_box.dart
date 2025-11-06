import 'package:flutter/material.dart';

class DecoratedBoxExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBox示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. DecoratedBox 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DecoratedBoxBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class DecoratedBoxBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //DecoratedBox 是一个可以在其子组件周围绘制装饰（如背景、边框、阴影等）的组件。
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue, // 背景色
          borderRadius: BorderRadius.circular(12), // 圆角
          boxShadow: [
            // 阴影
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            '装饰盒子',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}