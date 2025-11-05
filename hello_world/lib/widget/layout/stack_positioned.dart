import 'package:flutter/material.dart';

/// Stack 是一个层叠布局容器，允许其子组件在垂直方向上堆叠显示。子组件可以部分或完全重叠，类似于 CSS 中的绝对定位（position: absolute）。
/// Positioned 是一个定位组件，只能作为 Stack 的直接子组件使用。它通过设置 top、bottom、left、right 等属性来精确控制子组件在 Stack 中的位置。
/// Positioned 必须是 Stack 的直接子节点，否则会抛出异常。
class StackPositionedExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '1. Stack 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            StackBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class StackBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey[200],
      //Stack 是一个允许子组件重叠显示的布局组件，类似于 CSS 中的绝对定位。
      child: Stack(
        children: [
          Container(width: 200, height: 150, color: Colors.red),
          Container(width: 150, height: 100, color: Colors.green),
          Container(width: 100, height: 50, color: Colors.blue),
        ],
      ),
    );
  }
}
