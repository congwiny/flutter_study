/// Positioned 是一个定位组件，只能作为 Stack 的直接子组件使用。
/// 它通过设置 top、bottom、left、right 等属性来精确控制子组件在 Stack 中的位置。
/// Positioned 必须是 Stack 的直接子节点，否则会抛出异常。
///
import 'package:flutter/material.dart';

class PositionedExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Positoned示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '1. Positioned 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PositionedBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class PositionedBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey[200],
      child: Stack(
        children: [
          // 完全填充 Stack
          Container(color: Colors.blue[100]),

          // 使用 Positioned 精确定位
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red,
              child: Center(child: Text('top:20\nleft:20')),
            ),
          ),

          Positioned(
            top: 50,
            right: 50,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.green,
              child: Center(child: Text('top:50\nright:50')),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 100,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.orange,
              child: Center(child: Text('bottom:30\nleft:100')),
            ),
          ),

          Positioned(
            bottom: 40,
            right: 40,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.purple,
              child: Center(child: Text('bottom:40\nright:40')),
            ),
          ),
        ],
      ),
    );
  }
}
