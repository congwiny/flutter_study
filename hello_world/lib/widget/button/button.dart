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
              'ElevatedButton（凸起按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                print('按钮被点击了！');
              },
              onLongPress: () {
                print('按钮被长按了！');
              },
              child: Text('Elevated Button'),
            ),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}
