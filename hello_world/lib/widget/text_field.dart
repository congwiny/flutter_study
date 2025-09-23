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
            SizedBox(height: 20),
            TextField(),

            const Divider(height: 32),

            // 2. 基础配置
            const Text(
              '2. InputDecoration基础配置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                border: OutlineInputBorder(),
              ),
            ),

            const Divider(height: 32),

            // 3. 核心装饰属性详解
            const Text(
              '3. InputDecoration核心装饰属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                // 标签文本
                labelText: '邮箱地址',
                // 提示文本
                hintText: 'example@email.com',
                // 前缀图标
                prefixIcon: Icon(Icons.email),
                // 后缀图标
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                // 边框样式
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                // 聚焦时的边框样式
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                // 错误时的边框样式
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                // 标签样式
                labelStyle: TextStyle(color: Colors.pink),
                // 提示文本样式
                hintStyle: TextStyle(color: Colors.orange[400]),
                // 填充颜色
                fillColor: Colors.purple[50],
                filled: true,
                // 内容边距
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
