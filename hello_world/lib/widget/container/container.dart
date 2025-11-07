import 'package:flutter/material.dart';

class ContainerExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container组件示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Container 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ContainerBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. Container 的等价实现',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ContainerEquivalence(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class ContainerEquivalence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildComparison(
            '使用 Container',
            Container(
              width: 150,
              height: 80,
              //Container的外边距，即Container与外部组件之间的距离。
              margin: EdgeInsets.all(10),
              //Container内边距，即子组件与Container边界之间的距离。
              padding: EdgeInsets.all(16),
              //Container的装饰，例如背景、边框、阴影、渐变等。通常使用BoxDecoration。
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text('Container', style: TextStyle(color: Colors.white)),
            ),
          ),
          _buildComparison(
            '等价的手动组合',
            Container(
              margin: EdgeInsets.all(10),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150, height: 80),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('手动组合', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          _buildComparison(
            '总结',
            Text(
              'Container = Margin + Constraints + DecoratedBox + Padding + Child',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparison(String title, Widget content) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}

class ContainerBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(
            '基础容器',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
