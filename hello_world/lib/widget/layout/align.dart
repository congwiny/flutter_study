import 'package:flutter/material.dart';

class AlignExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align布局示例')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          const Text(
            '1. Align 基础示例',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AlignBasicExample(),
          const Divider(height: 32),
          const Text(
            '2. Align widthFactor 和 heightFactor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AlignFactorExample(),
          const Divider(height: 32),
          const Text(
            '3. Center 基础示例',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CenterBasicExample(),
          const Divider(height: 32),
          const Text(
            '4. Center 的其他等价实现',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CenterEquivalenceExample()
        ],
      ),
    );
  }
}

class AlignmentVsFractionalOffset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alignment vs FractionalOffset')),
      body: Column(
        children: [
          _buildComparisonItem(
            '相同点: 中心位置',
            'Alignment.center',
            Align(
              alignment: Alignment.center,
              child: _buildMarker('Alignment'),
            ),
            'FractionalOffset.center',
            Align(
              alignment: FractionalOffset.center,
              child: _buildMarker('FractionalOffset'),
            ),
          ),

          _buildComparisonItem(
            '不同点: 坐标系',
            'Alignment(0.5, 0)',
            Align(
              alignment: Alignment(0.5, 0), // 水平中心偏右，顶部
              child: _buildMarker('A(0.5,0)'),
            ),
            'FractionalOffset(0.5, 0)',
            Align(
              alignment: FractionalOffset(0.5, 0), // 水平中心，顶部
              child: _buildMarker('F(0.5,0)'),
            ),
          ),

          _buildComparisonItem(
            '边界位置',
            'Alignment.topLeft\n(-1, -1)',
            Align(
              alignment: Alignment.topLeft,
              child: _buildMarker('A(-1,-1)'),
            ),
            'FractionalOffset.topLeft\n(0, 0)',
            Align(
              alignment: FractionalOffset.topLeft,
              child: _buildMarker('F(0,0)'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonItem(
      String title,
      String leftLabel,
      Widget leftWidget,
      String rightLabel,
      Widget rightWidget,
      ) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(leftLabel, style: TextStyle(fontSize: 12)),
                    SizedBox(height: 4),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: leftWidget,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text(rightLabel, style: TextStyle(fontSize: 12)),
                    SizedBox(height: 4),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: rightWidget,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMarker(String text) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

///FractionalOffset
/// 除了Alignment，我们还可以使用FractionalOffset。
/// FractionalOffset的坐标系以父组件的左上角为原点(0,0)，右下角为(1,1)。
/// 所以，FractionalOffset(0.5, 0.5)表示父组件的中心。
/// 在Align中，我们可以使用FractionalOffset来替代Alignment。
///
class FractionalOffsetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FractionalOffset 坐标系')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FractionalOffset(dx, dy) 坐标系:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('• dx: 0.0(左) 到 1.0(右)'),
            Text('• dy: 0.0(上) 到 1.0(下)'),
            SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Stack(
                  children: [
                    // 各种 FractionalOffset 点
                    _buildFractionalPoint('(0, 0)', FractionalOffset.topLeft),
                    _buildFractionalPoint('(0.5, 0)', FractionalOffset.topCenter),
                    _buildFractionalPoint('(1, 0)', FractionalOffset.topRight),
                    _buildFractionalPoint('(0, 0.5)', FractionalOffset.centerLeft),
                    _buildFractionalPoint('(0.5, 0.5)', FractionalOffset.center),
                    _buildFractionalPoint('(1, 0.5)', FractionalOffset.centerRight),
                    _buildFractionalPoint('(0, 1)', FractionalOffset.bottomLeft),
                    _buildFractionalPoint('(0.5, 1)', FractionalOffset.bottomCenter),
                    _buildFractionalPoint('(1, 1)', FractionalOffset.bottomRight),

                    // 自定义点
                    _buildFractionalPoint('(0.2, 0.3)', FractionalOffset(0.2, 0.3)),
                    _buildFractionalPoint('(0.8, 0.7)', FractionalOffset(0.8, 0.7)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFractionalPoint(String label, FractionalOffset offset) {
    return Align(
      alignment: offset, // FractionalOffset 可以用于 Align
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.7),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}


class CenterEquivalenceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _buildComparison(
            '使用 Center 组件',
            Center(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                child: Center(child: Text('Center')),
              ),
            ),
          ),

          _buildComparison(
            '使用 Align 实现相同效果',
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: Center(child: Text('Align')),
              ),
            ),
          ),

          _buildComparison(
            '使用 Container 的 alignment',
            Container(
              alignment: Alignment.center, // Container 的 alignment 属性
              child: Container(
                width: 80,
                height: 80,
                color: Colors.orange,
                child: Center(child: Text('Container')),
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildComparison(String title, Widget widget) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey[100],
            child: widget,
          ),
        ],
      ),
    );
  }
}

class CenterBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _buildCenterExample(
            '1. 简单居中',
            Container(
              width: 200,
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                  child: Center(child: Text('居中')),
                ),
              ),
            ),
          ),

          _buildCenterExample(
            '2. 文本居中',
            Container(
              width: 200,
              height: 80,
              color: Colors.green[100],
              child: Center(
                child: Text(
                  '这段文本会居中显示',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),

          _buildCenterExample(
            '3. 多个子组件居中',
            Container(
              width: 200,
              height: 120,
              color: Colors.orange[100],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 30, color: Colors.orange),
                    SizedBox(height: 8),
                    Text('图标和文本都居中'),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildCenterExample(String title, Widget example) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          example,
        ],
      ),
    );
  }
}

class AlignFactorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWidthFactor('widthFactor: null（默认）', null), //Align宽度为最大宽度
        _buildWidthFactor('widthFactor: 1.0', 1.0),//Align宽度为子组件宽度
        _buildWidthFactor('widthFactor: 2.0', 2.0),//Align宽度为子组件宽度*2
      ],
    );
  }

  Widget _buildWidthFactor(String label, double? widthFactor) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          height: 120,
          color: Colors.grey[300], // 灰色背景用于观察 Align 的实际尺寸
          child: Align(
            alignment: Alignment.topRight,
            widthFactor: widthFactor,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Child', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}

class AlignmentCoordinateSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alignment 坐标系')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Alignment(x, y) 坐标系:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('• x: -1.0(左) 到 1.0(右)'),
            Text('• y: -1.0(上) 到 1.0(下)'),
            SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Stack(
                  children: [
                    // 坐标系网格
                    _buildCoordinateGrid(),

                    // 各种对齐点
                    _buildAlignmentPoint('(-1, -1)', Alignment.topLeft),
                    _buildAlignmentPoint('(0, -1)', Alignment.topCenter),
                    _buildAlignmentPoint('(1, -1)', Alignment.topRight),
                    _buildAlignmentPoint('(-1, 0)', Alignment.centerLeft),
                    _buildAlignmentPoint('(0, 0)', Alignment.center),
                    _buildAlignmentPoint('(1, 0)', Alignment.centerRight),
                    _buildAlignmentPoint('(-1, 1)', Alignment.bottomLeft),
                    _buildAlignmentPoint('(0, 1)', Alignment.bottomCenter),
                    _buildAlignmentPoint('(1, 1)', Alignment.bottomRight),

                    // 自定义点
                    _buildAlignmentPoint('(0.5, -0.5)', Alignment(0.5, -0.5)),
                    _buildAlignmentPoint('(-0.7, 0.3)', Alignment(-0.7, 0.3)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoordinateGrid() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.grey[100])),
              Container(width: 1, color: Colors.red),
              Expanded(child: Container(color: Colors.grey[100])),
            ],
          ),
        ),
        Container(height: 1, color: Colors.red),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.grey[100])),
              Container(width: 1, color: Colors.red),
              Expanded(child: Container(color: Colors.grey[100])),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlignmentPoint(String label, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.7),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}

class AlignBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Center容器让子项获得松散约束
    //Center 实际上是 Align 的一个特化版本, 固定 alignment: Alignment.center
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.grey[200],
        //Align 是一个可以将子组件对齐到父组件任意位置的组件，它使用相对坐标系统进行定位。
        child: Align(
          alignment: Alignment.topRight, // 让子组件对齐到右上角
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: Center(child: Text('右上角')),
          ),
        ),
      ),
    );
  }
}
