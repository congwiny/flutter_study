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

            const SelectableText(
              '可控制选择的文本',
              showCursor: true, // 显示光标
              cursorColor: Colors.red, // 光标颜色
              cursorWidth: 2.0, // 光标宽度
              cursorRadius: Radius.circular(2), // 光标圆角
              autofocus: false, // 是否自动获取焦点
              enableInteractiveSelection: true, // 是否启用交互选择
            ),

            const Divider(height: 32),

            //4. 监听选中变化
            const Text(
              '4. 监听选中变化',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SelectableText(
              '长按选中我，观察控制台输出',
              onSelectionChanged: (
                TextSelection selection,
                SelectionChangedCause? cause,
              ) {
                if (selection.isCollapsed) {
                  print('未选中任何文本');
                } else {
                  final start = selection.baseOffset;
                  final end = selection.extentOffset;
                  print('选中文本范围: $start ~ $end');
                  // 获取选中文本内容
                  final text = '长按选中我，观察控制台输出';
                  final selectedText = text.substring(
                    selection.start,
                    selection.end,
                  );
                  print('选中内容: $selectedText');
                }
              },
            ),

            const Divider(height: 32),

            //5. SelectableText.rich —— 富文本选择
            const Text(
              '5. 富文本选择',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SelectableText.rich(
              TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: '这是'),
                  TextSpan(
                    text: ' 加粗红色',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(text: ' 和', style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: ' 斜体蓝色',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: ' 的混合文本'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
