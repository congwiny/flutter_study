import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button 组件示例')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ElevatedButton（凸起按钮）
            const Text(
              '1. ElevatedButton（凸起按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                print('按钮被点击了！');
              },
              onLongPress: () {
                print('按钮被长按了！');
              },
              //styleFrom() 是静态工厂方法，用于快速创建 ButtonStyle
              style: ElevatedButton.styleFrom(
                //文字/图标颜色
                foregroundColor: Colors.red,
                // 背景色
                backgroundColor: Colors.blue,
                // 阴影高度（0~24）
                elevation: 5,
                // 内边距
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                // 形状
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 圆角
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.add), SizedBox(width: 8), Text('添加项目')],
              ),
            ),
            const Divider(height: 32),
            // 1.  TextButton（文本按钮）
            const Text(
              '2. TextButton（文本按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                print('文本按钮被点击了！');
              },
              onLongPress: () {
                print('文本按钮被长按了！');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,         // 文字颜色
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline, // 下划线
                ),
              ),
              child: Text('自定义文本按钮'),
            )
          ],
        ),
      ),
    );
  }
}
