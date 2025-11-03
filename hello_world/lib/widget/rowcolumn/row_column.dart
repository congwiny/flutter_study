import 'package:flutter/material.dart';

class RowColumnExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row和Column 组件示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. 主轴与交叉轴',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            AxisExplanation(),
            const Divider(height: 32),
            const Text(
              '2. Row主轴对齐',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MainAxisAlignExample(),
            const Divider(height: 32),
            const Text(
              '3. Row主轴Space的区别',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SpaceComparison(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class SpaceComparison extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSpaceExample('spaceBetween', MainAxisAlignment.spaceBetween),
        _buildSpaceExample('spaceAround', MainAxisAlignment.spaceAround),
        _buildSpaceExample('spaceEvenly', MainAxisAlignment.spaceEvenly),
      ],
    );
  }

  Widget _buildSpaceExample(String type, MainAxisAlignment alignment) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: alignment,
              children: List.generate(
                3,
                (index) => Container(
                  width: 30,
                  color: [Colors.red, Colors.green, Colors.blue][index],
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text('剩余空间分配方式不同'),
        ],
      ),
    );
  }
}

class MainAxisAlignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //从主轴起点开始排列（默认）
        _buildExampleRow('start', MainAxisAlignment.start),
        //从主轴终点开始排列
        _buildExampleRow('end', MainAxisAlignment.end),
        //主轴居中对齐
        _buildExampleRow('center', MainAxisAlignment.center),
        //主轴两端对齐，item之间的间距都相等
        _buildExampleRow('spaceBetween', MainAxisAlignment.spaceBetween),
        //主轴均等间隔排列，将剩余空间平均分配到子组件周围，每个子组件左右（或上下）的空间相等，相邻子组件之间的空间会叠加。
        _buildExampleRow('spaceAround', MainAxisAlignment.spaceAround),
        //将剩余空间平均分配，使每个子组件之间的间隔相等，包括两端。
        _buildExampleRow('spaceEvenly', MainAxisAlignment.spaceEvenly),
      ],
    );
  }

  Widget _buildExampleRow(String label, MainAxisAlignment alignment) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MainAxisAlignment.$label:'),
          Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                Container(width: 40, height: 40, color: Colors.red),
                Container(width: 40, height: 40, color: Colors.green),
                Container(width: 40, height: 40, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AxisExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Row: 主轴 = 水平，交叉轴 = 垂直'),
        Text('Column: 主轴 = 垂直，交叉轴 = 水平'),
      ],
    );
  }
}
