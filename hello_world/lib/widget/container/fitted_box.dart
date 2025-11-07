import 'package:flutter/material.dart';

class FittedBoxExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. FittedBox 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FittedBoxBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class FittedBoxBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.red,
        //FittedBox 是一个可以根据自身尺寸调整子组件大小的组件，
        //类似于 CSS 中的 object-fit 属性，主要用于控制子组件的缩放和对齐方式。
        child: FittedBox(
          child: Container(
            width: 300, // 比父容器大，会被缩放
            height: 150,
            color: Colors.blue.withOpacity(0.2),
            child: Center(
              child: Text('被缩放的容器', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
