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
            const Text(
              '3. Container尺寸相关属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ContainerSizeProperties(),
            const Divider(height: 32),
            const Text(
              '3. Container装饰相关属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ContainerDecorationProperties()
          ],
        ),
      ),
    );
  }
}

class ContainerDecorationProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDecorationExample(
            '1. color 属性',
            '设置背景颜色',
            Container(
              width: 150,
              height: 80,
              color: Colors.blue,
              child: Center(child: Text('纯色背景', style: TextStyle(color: Colors.white))),
            ),
          ),
          _buildDecorationExample(
            '2. decoration 属性',
            '复杂装饰效果',
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(child: Text('渐变+阴影', style: TextStyle(color: Colors.white))),
            ),
          ),
          _buildDecorationExample(
            '3. color 与 decoration 冲突',
            '不能同时设置 color 和 decoration',
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green, // 在 decoration 中设置颜色
                borderRadius: BorderRadius.circular(8),
              ),
              // color: Colors.blue, // 错误：不能同时设置
              child: Center(child: Text('在 decoration 中设置颜色')),
            ),
          ),
          _buildDecorationExample(
            '4. foregroundDecoration',
            '前景装饰（绘制在 child 之上）',
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
              ),
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(child: Text('前景渐变遮罩', style: TextStyle(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorationExample(String title, String description, Widget container) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Center(child: container),
        ],
      ),
    );
  }
}

class ContainerSizeProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSizeExample(
            '1. width 和 height',
            '固定尺寸',
            Container(
              width: 120,
              height: 60,
              color: Colors.blue[100],
              child: Center(child: Text('120 x 60')),
            ),
          ),
          _buildSizeExample(
            '2. constraints',
            '尺寸约束',
            Container(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 200,
                minHeight: 50,
                maxHeight: 100,
              ),
              color: Colors.green[100],
              child: Center(child: Text('约束容器 (200 x 100)')),
            ),
          ),
          _buildSizeExample(
            '3. 无尺寸约束',
            '充满可用空间',
            Container(
              color: Colors.orange[100],
              child: Center(child: Text('充满父容器')),
            ),
          ),
          _buildSizeExample(
            '4. 结合 constraints 和尺寸',
            'constraints 优先',
            Container(
              width: 300,  // 会被忽略
              height: 200, // 会被忽略
              constraints: BoxConstraints.tightFor(width: 150, height: 80),
              color: Colors.purple[100],
              child: Center(child: Text('150 x 80')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeExample(String title, String description, Widget container) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Container(
            height: 100,
            child: Center(child: container),
          ),
        ],
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
