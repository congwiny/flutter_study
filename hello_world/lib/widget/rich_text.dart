import 'package:flutter/material.dart';

class RichTextDemoPage extends StatelessWidget {
  const RichTextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RichText 使用大全')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 基础混合样式
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.blue, fontSize: 18), // 父样式
                children: [
                  TextSpan(text: '普通文本 '), // 继承父级蓝色、18px
                  TextSpan(
                    text: '红色加粗 ',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ), // 覆盖 color & weight，保留 fontSize
                  ),
                  TextSpan(
                    text: '绿色大字',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ), // 覆盖 color & fontSize
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
