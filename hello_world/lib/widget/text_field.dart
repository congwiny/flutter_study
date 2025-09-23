import 'package:flutter/material.dart';

//TextField 是 Flutter 中最常用的文本输入组件，用于接收用户的文本输入。
//它提供了丰富的配置选项和交互功能。
class TextFieldDemoPage extends StatelessWidget {
  const TextFieldDemoPage({super.key});

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
              '1. 最简单的TextField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            TextField(),

            const Divider(height: 32),

            // 2. 基础配置
            const Text(
              '2. InputDecoration基础配置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
