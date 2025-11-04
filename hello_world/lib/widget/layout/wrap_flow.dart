import 'package:flutter/material.dart';

class WrapFlowExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('流式布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Wrap 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            WrapBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

/// Wrap：是一个灵活的流式布局组件，当子组件在主轴方向上空间不足时，会自动换行到交叉轴方向。
/// 它使用简单，类似于Row和Column，但具有自动换行的能力。
class WrapBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      //主轴方向的对齐方式，默认为WrapAlignment.start。
      alignment: WrapAlignment.start,
      //交叉轴方向的对齐方式，默认为WrapAlignment.start。
      runAlignment: WrapAlignment.start,
      // 主轴方向间距
      spacing: 8.0,
      // 交叉轴方向间距
      runSpacing: 12.0,
      children: List.generate(
        10,
        (index) => Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Item $index'),
        ),
      ),
    );
  }
}
