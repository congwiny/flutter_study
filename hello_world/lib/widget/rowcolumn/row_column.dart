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
            const Text(
              '4. Row交叉轴对齐',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CrossAxisAlignExample(),
            const Divider(height: 32),
            const Text(
              '5. Row弹性布局：Expanded 和 Flexible',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FlexWidgetsExample(),
            const Divider(height: 32),
            const Text(
              '6. 设置Row主轴尺寸',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MainAxisSizeExample()
          ],
        ),
      ),
    );
  }
}

class MainAxisSizeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSizeExample('MainAxisSize.max (默认)', MainAxisSize.max),
        SizedBox(height: 20),
        _buildSizeExample('MainAxisSize.min', MainAxisSize.min),
      ],
    );
  }

  Widget _buildSizeExample(String label, MainAxisSize size) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            color: Colors.yellow[100],
            child: Row(
              //设置主轴的尺寸
              mainAxisSize: size,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
          ),
          Text('Row宽度: ${size == MainAxisSize.max ? '充满父容器' : '包裹内容'}'),
        ],
      ),
    );
  }
}

class FlexWidgetsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('1. Expanded - 强制填充剩余空间'),
        Container(
          height: 60,
          child: Row(
            children: [
              Container(width: 50, color: Colors.red),
              Expanded( // 等价于 Flexible(fit: FlexFit.tight)
                // 占据所有剩余空间
                child: Container(color: Colors.blue),
              ),
              Container(width: 50, color: Colors.green),
            ],
          ),
        ),

        SizedBox(height: 20),
        Text('2. Flexible - 按 flex 权重分配空间'),
        Container(
          height: 60,
          child: Row(
            children: [
              //flex 权重（默认为 1）
              Flexible(flex: 1, child: Container(color: Colors.red)),
              // 占 2/3 剩余宽度
              Flexible(flex: 2, child: Container(color: Colors.green)),
              Flexible(flex: 1, child: Container(color: Colors.blue)),
            ],
          ),
        ),

        SizedBox(height: 20),
        Text('3. Flexible.fit 属性对比'),
        Container(
          height: 60,
          child: Row(
            children: [
              //flex 权重默认为 1
              Flexible(
                fit: FlexFit.loose, // 可以小于分配的空间
                child: Container(
                  color: Colors.red,
                    child: Text('你好')
                ),
              ),
              //flex 权重默认为 1
              Flexible(
                fit: FlexFit.tight, // 根据两个Flexible权重，此Flexible分配的空间为 Row宽度 * 1/2
                child: Container(color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CrossAxisAlignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              //在交叉轴起点对齐。
              _buildExampleColumn('start', CrossAxisAlignment.start),
              //在交叉轴终点对齐。
              _buildExampleColumn('end', CrossAxisAlignment.end),
              //在交叉轴居中对齐（默认）。
              _buildExampleColumn('center', CrossAxisAlignment.center),
              //拉伸子组件以填满交叉轴方向。
              _buildExampleColumn('stretch', CrossAxisAlignment.stretch),
              //按基线对齐（需要设置 textBaseline）。
              _buildExampleColumn('baseline', CrossAxisAlignment.baseline),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleColumn(String label, CrossAxisAlignment alignment) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CrossAxisAlignment.$label:'),
          Container(
            width: 200,
            height: 80,
            color: Colors.grey[200],
            child: Row(
              crossAxisAlignment: alignment,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(width: 30, height: 20, color: Colors.red),
                Container(width: 30, height: 40, color: Colors.green),
                Container(width: 30, height: 60, color: Colors.blue),
                if (alignment == CrossAxisAlignment.baseline)
                  Text('基线', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
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
