import 'package:flutter/material.dart';

class WrapFlowExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('流式布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '1. Wrap 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            WrapBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. Wrap 核心属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            WrapPropertiesExample(),
            const Divider(height: 32),
            const Text(
              '3. Wrap 对齐方式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            WrapAlignmentExample(),
            const Divider(height: 32),
            const Text(
              '4. Wrap 交叉轴对齐',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            WrapCrossAlignmentExample(),
          ],
        ),
      ),
    );
  }
}


class WrapCrossAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCrossAlignmentExample(
          'crossAxisAlignment: WrapCrossAlignment.start',
          WrapCrossAlignment.start,
        ),
        _buildCrossAlignmentExample(
          'crossAxisAlignment: WrapCrossAlignment.center',
          WrapCrossAlignment.center,
        ),
        _buildCrossAlignmentExample(
          'crossAxisAlignment: WrapCrossAlignment.end',
          WrapCrossAlignment.end,
        ),
      ],
    );
  }

  Widget _buildCrossAlignmentExample(String title, WrapCrossAlignment alignment) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12)),
          SizedBox(height: 8),
          Container(
            height: 80,
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: alignment,
              children: [
                Container(width: 80, height: 20, color: Colors.red),
                Container(width: 60, height: 30, color: Colors.green),
                Container(width: 100, height: 25, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WrapAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAlignmentExample(
          'alignment: WrapAlignment.start',
          WrapAlignment.start,
        ),
        _buildAlignmentExample(
          'alignment: WrapAlignment.center',
          WrapAlignment.center,
        ),
        _buildAlignmentExample(
          'alignment: WrapAlignment.end',
          WrapAlignment.end,
        ),
        _buildAlignmentExample(
          'alignment: WrapAlignment.spaceBetween',
          WrapAlignment.spaceBetween,
        ),
        _buildAlignmentExample(
          'alignment: WrapAlignment.spaceAround',
          WrapAlignment.spaceAround,
        ),
        _buildAlignmentExample(
          'alignment: WrapAlignment.spaceEvenly',
          WrapAlignment.spaceEvenly,
        ),
      ],
    );
  }

  Widget _buildAlignmentExample(String title, WrapAlignment alignment) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12)),
          SizedBox(height: 8),
          Wrap(
            alignment: alignment,
            children: [
              Container(width: 60, height: 30, color: Colors.red),
              Container(width: 50, height: 30, color: Colors.green),
              Container(width: 70, height: 30, color: Colors.blue),
              Container(width: 80, height: 30, color: Colors.pink),
              Container(width: 90, height: 30, color: Colors.orange),
              Container(width: 100, height: 30, color: Colors.cyan),
            ],
          ),
        ],
      ),
    );
  }
}

class WrapPropertiesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWrapExample(
          '1. direction: Axis.horizontal (默认)',
          Wrap(
            direction: Axis.horizontal,
            children: _buildChips(6),
          ),
        ),

        _buildWrapExample(
          '2. direction: Axis.vertical',
          Container(
            height: 200,
            child: Wrap(
              direction: Axis.vertical,
              children: _buildChips(6),
            ),
          ),
        ),

        _buildWrapExample(
          '3. spacing: 主轴间距',
          Wrap(
            spacing: 20.0, // 水平间距
            children: _buildChips(5),
          ),
        ),

        _buildWrapExample(
          '4. runSpacing: 交叉轴间距',
          Wrap(
            runSpacing: 15.0, // 垂直间距
            children: _buildChips(8),
          ),
        ),
      ],
    );
  }

  Widget _buildWrapExample(String title, Widget wrap) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          wrap,
        ],
      ),
    );
  }

  List<Widget> _buildChips(int count) {
    return List.generate(count, (index) => Chip(
      label: Text('Item $index'),
      backgroundColor: Colors.primaries[index % Colors.primaries.length][100],
    ));
  }
}

/// Wrap：是一个灵活的流式布局组件，当子组件在主轴方向上空间不足时，会自动换行到交叉轴方向。
/// 它使用简单，类似于Row和Column，但具有自动换行的能力。
class WrapBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      //主轴方向的对齐方式，默认为WrapAlignment.start。
      alignment: WrapAlignment.start,
      //交叉轴方向的对齐方式，默认为WrapAlignment.start。
      runAlignment: WrapAlignment.start,
      // 主轴方向间距
      spacing: 8.0,
      // 交叉轴方向间距
      runSpacing: 12.0,
      children: List.generate(
        10,
        (index) => Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Item $index'),
        ),
      ),
    );
  }
}
