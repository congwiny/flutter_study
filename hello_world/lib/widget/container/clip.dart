import 'package:flutter/material.dart';

class ClipExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clip示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Clip 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ClipBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

//Clip 是一组用于剪裁子组件的组件，可以限制子组件的显示区域，创建各种形状的视觉效果。
//Flutter 提供了多种剪裁组件，如 ClipRect、ClipRRect、ClipOval、ClipPath 等
class ClipBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildClipExample(
            '原始图形',
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('原始')),
            ),
          ),
          SizedBox(height: 20),
          _buildClipExample(
            'ClipOval圆形剪裁',
            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text('圆形')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClipExample(String title, Widget child) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        child,
      ],
    );
  }
}
