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
            const Text(
              '2. DecoratedBox和Container对比',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DecoratedBoxVsContainer(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class DecoratedBoxVsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildComparison(
            '使用 DecoratedBox',
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red[100],
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('DecoratedBox 示例'),
              ),
            ),
          ),
          _buildComparison(
            '使用 Container（内部使用 DecoratedBox）',
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Text('Container 示例'),
            ),
          ),
          _buildComparison(
            '总结',
            Text('Container 实际上是多个组件的组合，\n其中就包含 DecoratedBox'),
          ),
        ],
      ),
    );
  }

  Widget _buildComparison(String title, Widget content) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          content,
        ],
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