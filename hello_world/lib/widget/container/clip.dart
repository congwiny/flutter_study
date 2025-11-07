import 'package:flutter/material.dart';

class ClipExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clip示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Clip 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ClipBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. Clip 组件家族',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ClipFamilyOverview(),
            const Divider(height: 32),
            const Text(
              '3. ClipOval 基础用法',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ClipOvalBasic(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class ClipOvalBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildOvalExample(
            '1. 正方形 -> 圆形',
            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                    child: Text('圆形', style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
          _buildOvalExample(
            '2. 长方形 -> 椭圆',
            ClipOval(
              child: Container(
                width: 150,
                height: 100,
                color: Colors.green,
                child: Center(
                    child: Text('椭圆', style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
          _buildOvalExample(
            '3. 图片圆形剪裁',
            ClipOval(
              child: Image.network(
                'https://picsum.photos/150',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildOvalExample(
            '4. 带边框的圆形',
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 3),
              ),
              child: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                  child: Center(child: Text('带边框')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOvalExample(String title, Widget child) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class ClipFamilyOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildClipType(
                  'ClipOval', '圆形/椭圆剪裁', Icons.circle, Colors.blue),
              _buildClipType(
                  'ClipRect', '矩形剪裁', Icons.crop_square, Colors.green),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildClipType(
                'ClipRRect', '圆角矩形剪裁', Icons.rounded_corner,
                Colors.orange),
              _buildClipType(
                  'ClipPath', '路径剪裁', Icons.architecture, Colors.purple),
            ])
      ],
    );
  }

  Widget _buildClipType(String name, String description, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

//Clip 是一组用于剪裁子组件的组件，可以限制子组件的显示区域，创建各种形状的视觉效果。
//Flutter 提供了多种剪裁组件，如 ClipRect、ClipRRect、ClipOval、ClipPath 等
class ClipBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildClipExample(
            '原始图形',
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('原始')),
            ),
          ),
          SizedBox(height: 20),
          _buildClipExample(
            'ClipOval圆形剪裁',
            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text('圆形')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClipExample(String title, Widget child) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        child,
      ],
    );
  }
}
