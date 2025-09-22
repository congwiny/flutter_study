import 'package:flutter/gestures.dart';
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
            const Text(
              '1. 基础混合样式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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

            const Divider(height: 32),

            //推荐使用Text.rich创建富文本
            const Text(
              '2. 推荐使用Text.rich创建富文本',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text.rich(
              TextSpan(
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

            const Divider(height: 32),

            const Text(
              '3. 可点击链接（带下划线）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // 2. 可点击链接（带下划线）
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '阅读用户协议和'),
                  TextSpan(
                    text: ' 隐私政策',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                              context: context,
                              builder:
                                  (ctx) => AlertDialog(
                                    title: Text('隐私政策'),
                                    content: Text('您的隐私安全是我们最重要的责任...'),
                                  ),
                            );
                          },
                  ),
                  TextSpan(text: ' 以继续'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
