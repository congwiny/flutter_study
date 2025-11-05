import 'package:flutter/material.dart';

/// Stack 是一个层叠布局容器，允许其子组件在垂直方向上堆叠显示。子组件可以部分或完全重叠，类似于 CSS 中的绝对定位（position: absolute）。
/// Positioned 是一个定位组件，只能作为 Stack 的直接子组件使用。它通过设置 top、bottom、left、right 等属性来精确控制子组件在 Stack 中的位置。
/// Positioned 必须是 Stack 的直接子节点，否则会抛出异常。
class StackPositionedExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '1. Stack 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            StackBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. Stack Alignment属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            StackAlignmentExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class StackAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStackExample(
          //alignment：决定如何对齐非定位子组件（没有使用 Positioned 包裹的子组件）。
          '1. alignment: Alignment.topLeft (默认)',
          Stack(alignment: Alignment.topLeft, children: _buildLayers()),
        ),

        _buildStackExample(
          '2. alignment: Alignment.topCenter',
          Stack(alignment: Alignment.topCenter, children: _buildLayers()),
        ),

        _buildStackExample(
          '3. alignment: Alignment.topRight',
          Stack(alignment: Alignment.topRight, children: _buildLayers()),
        ),

        _buildStackExample(
          '4. alignment: Alignment.centerLeft',
          Stack(alignment: Alignment.centerLeft, children: _buildLayers()),
        ),

        _buildStackExample(
          '5. alignment: Alignment.center',
          Stack(alignment: Alignment.center, children: _buildLayers()),
        ),

        _buildStackExample(
          '6. alignment: Alignment.centerRight',
          Stack(alignment: Alignment.centerRight, children: _buildLayers()),
        ),
        _buildStackExample(
          '7. alignment: Alignment.bottomLeft',
          Stack(alignment: Alignment.bottomLeft, children: _buildLayers()),
        ),
        _buildStackExample(
          '8. alignment: Alignment.bottomCenter',
          Stack(alignment: Alignment.bottomCenter, children: _buildLayers()),
        ),
        _buildStackExample(
          '9. alignment: Alignment.bottomRight',
          Stack(alignment: Alignment.bottomRight, children: _buildLayers()),
        ),
      ],
    );
  }

  Widget _buildStackExample(String title, Stack stack) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 150,
            color: Colors.grey[200],
            child: stack,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLayers() {
    return [
      Container(width: 180, height: 130, color: Colors.red.withOpacity(0.7)),
      Container(width: 130, height: 80, color: Colors.green.withOpacity(0.7)),
      Container(width: 80, height: 30, color: Colors.blue.withOpacity(0.7)),
    ];
  }
}

class StackBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey[200],
      //Stack 是一个允许子组件重叠显示的布局组件，类似于 CSS 中的绝对定位。
      child: Stack(
        children: [
          Container(width: 200, height: 150, color: Colors.red),
          Container(width: 150, height: 100, color: Colors.green),
          Container(width: 100, height: 50, color: Colors.blue),
        ],
      ),
    );
  }
}
