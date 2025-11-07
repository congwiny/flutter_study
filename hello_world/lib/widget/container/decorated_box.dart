import 'package:flutter/material.dart';

class DecoratedBoxExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBox示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. DecoratedBox 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DecoratedBoxBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. DecoratedBox和Container对比',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DecoratedBoxVsContainer(),
            const Divider(height: 32),
            const Text(
              '3. BoxDecoration 颜色和渐变',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ColorAndGradientExample(),
            const Divider(height: 32),
            const Text(
              '4. BoxDecoration 边框和圆角',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BorderAndBorderRadiusExample(),
          ],
        ),
      ),
    );
  }
}

class BorderAndBorderRadiusExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16), // 卡片内边距
      child: Column(
        children: [
          _buildBorderExample(
            '1. 统一边框',
            BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          _buildBorderExample(
            '2. 不同方向的边框',
            BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.red, width: 4),
                left: BorderSide(color: Colors.green, width: 2),
                right: BorderSide(color: Colors.blue, width: 2),
                bottom: BorderSide(color: Colors.orange, width: 4),
              ),
            ),
          ),
          _buildBorderExample(
            '3. 不对称圆角',
            BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(color: Colors.purple),
            ),
          ),
          _buildBorderExample(
            '4. 圆形',
            BoxDecoration(
              color: Colors.orange[100],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 3),
            ),
          ),
          _buildBorderExample(
            '5. 椭圆',
            BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(50), // 高度的一半
              border: Border.all(color: Colors.teal, width: 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBorderExample(String title, BoxDecoration decoration) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            height: 80,
            child: DecoratedBox(
              decoration: decoration,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorAndGradientExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16), // 卡片内边距
      child: Column(
        children: [
          _buildDecorationExample(
            '1. 纯色背景',
            BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          _buildDecorationExample(
            '2. 线性渐变',
            BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          _buildDecorationExample(
            '3. 径向渐变',
            BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [Colors.yellow, Colors.orange],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          _buildDecorationExample(
            '4. 扫描渐变',
            BoxDecoration(
              gradient: SweepGradient(
                center: Alignment.center,
                colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.red],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          _buildDecorationExample(
            '5. 渐变 + 颜色透明度',
            BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.red.withOpacity(0.3),
                  Colors.blue.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorationExample(String title, BoxDecoration decoration) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            height: 80,
            child: DecoratedBox(
              decoration: decoration,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DecoratedBoxVsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildComparison(
            '使用 DecoratedBox',
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red[100],
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('DecoratedBox 示例'),
              ),
            ),
          ),
          _buildComparison(
            '使用 Container（内部使用 DecoratedBox）',
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Text('Container 示例'),
            ),
          ),
          _buildComparison(
            '总结',
            Text('Container 实际上是多个组件的组合，\n其中就包含 DecoratedBox'),
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

class DecoratedBoxBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //DecoratedBox 是一个可以在其子组件周围绘制装饰（如背景、边框、阴影等）的组件。
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue, // 背景色
          borderRadius: BorderRadius.circular(12), // 圆角
          boxShadow: [
            // 阴影
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            '装饰盒子',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}