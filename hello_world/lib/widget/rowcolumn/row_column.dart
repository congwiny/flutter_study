import 'package:flutter/material.dart';

class RowColumnExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Row和Column 组件示例')),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1. 主轴与交叉轴',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AxisExplanation(),
                  const Divider(height: 32),

                ],
            ),
        ),
    );
  }
}

class AxisExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Row: 主轴 = 水平，交叉轴 = 垂直'),
        Text('Column: 主轴 = 垂直，交叉轴 = 水平'),
      ],
    );
  }
}