import 'package:flutter/material.dart';

class TextDemoPage extends StatelessWidget {
  const TextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text 组件演示')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 基础文本
            const Text(
              '1. 基础文本',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Hello, Flutter!'),

            const Divider(height: 32),

            // 2. 样式文本
            const Text(
              '2. 样式文本',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '多彩文本样式',
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationStyle: TextDecorationStyle.wavy,
                letterSpacing: 2,
                height: 1.8,
              ),
            ),
            Text(
              'Flutter 文字样式大全',
              style: TextStyle(
                fontSize: 24, //字体大小
                color: Colors.blueAccent, //文字颜色
                fontWeight: FontWeight.bold, //粗细：normal,bold,w300,w700等
                fontStyle: FontStyle.italic, //斜体：normal,italic
                fontFamily: 'MaShanZheng', //字体族名
                letterSpacing: 1.5, //字符间距
                wordSpacing: 3.0, //单词间距
                decoration: TextDecoration.underline, //下划线、删除线等
                decorationColor: Colors.red, //装饰线颜色
                decorationStyle:
                    TextDecorationStyle.dashed, //装饰线样式：solid, dashed, dotted
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ], //阴影效果
                height: 1.5, // 行高 = fontSize * 1.5
              ),
            ),
            const Divider(height: 32),

            // 2. 水平对齐方式
            const Text(
              '3. 水平对齐方式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.blue[100], // 背景颜色
              padding: EdgeInsets.all(16), // 内边距
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // 让子项宽度占满
                children: [
                  Text('左对齐', textAlign: TextAlign.left),
                  Text('居中对齐', textAlign: TextAlign.center),
                  Text('右对齐', textAlign: TextAlign.right),
                  Text('两端对齐\n这是第二行\n这是第三行', textAlign: TextAlign.justify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
