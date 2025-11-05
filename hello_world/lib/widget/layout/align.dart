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
        ],
      ),
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
