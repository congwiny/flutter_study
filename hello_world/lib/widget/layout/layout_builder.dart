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
            const Text(
              '2. BoxConstraints 示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BoxConstraintsExplanation(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class BoxConstraintsExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BoxConstraints 属性:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildConstraintItem('minWidth', '最小宽度约束'),
        _buildConstraintItem('maxWidth', '最大宽度约束'),
        _buildConstraintItem('minHeight', '最小高度约束'),
        _buildConstraintItem('maxHeight', '最大高度约束'),
        SizedBox(height: 20),
        Text('约束类型:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildConstraintTypeExample(),
      ],
    );
  }

  Widget _buildConstraintItem(String name, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text('• $name:', style: TextStyle(fontFamily: 'monospace')),
          SizedBox(width: 8),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildConstraintTypeExample() {
    return Column(
      children: [
        _buildConstraintExample(
          '严格约束 (Tight)',
          'minWidth == maxWidth\nminHeight == maxHeight',
          BoxConstraints.tight(Size(100, 50)),
        ),
        _buildConstraintExample(
          '宽松约束 (Loose)',
          'minWidth = 0, minHeight = 0\n有最大宽度和高度',
          BoxConstraints.loose(Size(200, 100)),
        ),
        // _buildConstraintExample(
        //   '扩展约束 (Expand)',
        //   '无限宽高可用空间',
        //   BoxConstraints.expand(),
        // ),
        _buildConstraintExample(
          '有界约束 (Bounded)',
          '有明确的最小和最大范围',
          BoxConstraints(minWidth: 50, maxWidth: 150, minHeight: 30, maxHeight: 80),
        ),
      ],
    );
  }

  Widget _buildConstraintExample(String title, String description,
      BoxConstraints constraints) {
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 12)),
            SizedBox(height: 8),
            Text(
              '约束: $constraints',
              style: TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
            ConstrainedBox(constraints: constraints,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ));
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
