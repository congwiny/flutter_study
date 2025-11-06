import 'package:flutter/material.dart';

class LayoutBuilderExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayoutBuilder布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. LayoutBuilder 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LayoutBuilderBasicExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class LayoutBuilderBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey[200],
      //Center容器让LayoutBuilder获得松散约束
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.6,
              color: Colors.blue,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Text(
                      '宽度: ${constraints.maxWidth}\n高度: ${constraints.maxHeight}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
