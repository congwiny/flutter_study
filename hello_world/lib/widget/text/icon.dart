import 'package:flutter/material.dart';

class IconFontDemoPage extends StatelessWidget {
  const IconFontDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IconFont')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 文字图标
            const Text(
              '1. 文字图标',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              "\uE03e\uE237\uE287",
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            const Divider(height: 32),
            // 2. 字体图标
            const Text(
              '2. Icon字体图标',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.accessible,color: Colors.green),
                Icon(Icons.error,color: Colors.green),
                Icon(Icons.fingerprint,color: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}
