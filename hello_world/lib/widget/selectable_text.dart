import 'package:flutter/material.dart';

class SelectableTextDemoPage extends StatelessWidget {
  const SelectableTextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SelectableText 使用大全')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 最简单的使用
            const Text(
              '1. 最简单的使用',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SelectableText('这是一个可选择的文本'),

            const Divider(height: 32),

            //2. 基础属性设置
            const Text(
              '2. 基础属性设置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SelectableText(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const Divider(height: 32),

            //3. 选择控制属性
            const Text(
              '3. 选择控制属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SelectableText(
              '可控制选择的文本',
              showCursor: true, // 显示光标
              cursorColor: Colors.red, // 光标颜色
              cursorWidth: 2.0, // 光标宽度
              cursorRadius: Radius.circular(2), // 光标圆角
              autofocus: false, // 是否自动获取焦点
              enableInteractiveSelection: true, // 是否启用交互选择
            ),
          ],
        ),
      ),
    );
  }
}
