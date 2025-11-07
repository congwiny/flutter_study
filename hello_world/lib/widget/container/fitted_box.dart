import 'package:flutter/material.dart';

class FittedBoxExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. FittedBox 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FittedBoxBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. FittedBox 核心作用',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FittedBoxCoreConcept(),
            const Divider(height: 32),
            const Text(
              '3. FittedBox的fit属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BoxFitExplanation(),
            const Divider(height: 32),
            const Text(
              '4. 各种 Fit 模式的视觉效果对比',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BoxFitVisualComparison(),
            const Divider(height: 32),
            const Text(
              '5. FittedBox 对齐方式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FittedBoxAlignment(),
            const Divider(height: 32),
            const Text(
              '6. Fit 和 Alignment 组合效果',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FitAndAlignmentCombination(),
            const Divider(height: 32),
            const Text(
              '7. 图标和图片适配',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconAndImageFitting()
          ],
        ),
      ),
    );
  }
}

class IconAndImageFitting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildExample(
            '1. 大图标在小容器中',
            Container(
              width: 40,
              height: 40,
              color: Colors.blue[100],
              child: FittedBox(
                child: Icon(Icons.star, size: 60, color: Colors.blue),
              ),
            ),
          ),
          _buildExample(
            '2. 图片自适应容器',
            Container(
              width: 150,
              height: 80,
              color: Colors.grey[100],
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  'https://picsum.photos/300/200',
                  width: 300,
                  height: 200,
                ),
              ),
            ),
          ),
          _buildExample(
            '3. 保持比例的图片',
            Container(
              width: 120,
              height: 120,
              color: Colors.green[100],
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network(
                  'https://picsum.photos/250/150',
                  width: 250,
                  height: 150,
                ),
              ),
            ),
          ),
          _buildExample(
            '4. 多个图标统一大小',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildUniformIcon(Icons.home, Colors.red),
                _buildUniformIcon(Icons.search, Colors.blue),
                _buildUniformIcon(Icons.settings, Colors.green),
                _buildUniformIcon(Icons.person, Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _buildUniformIcon(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FittedBox(
        child: Icon(icon, color: color),
      ),
    );
  }
}

class FitAndAlignmentCombination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildCombinationExample(
            'BoxFit.contain + Alignment.topLeft',
            BoxFit.contain,
            Alignment.topLeft,
          ),
          _buildCombinationExample(
            'BoxFit.cover + Alignment.center',
            BoxFit.cover,
            Alignment.center,
          ),
          _buildCombinationExample(
            'BoxFit.none + Alignment.bottomRight',
            BoxFit.none,
            Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  Widget _buildCombinationExample(String title, BoxFit fit, Alignment alignment) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey),
            ),
            child: FittedBox(
              fit: fit,
              alignment: alignment,
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.yellow],
                  ),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    '120x80',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FittedBoxAlignment extends StatelessWidget {
  final List<Alignment> alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: alignments.length,
      itemBuilder: (context, index) {
        return _buildAlignmentExample(alignments[index]);
      },
    );
  }

  Widget _buildAlignmentExample(Alignment alignment) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              color: Colors.green[100],
              child: FittedBox(
                fit: BoxFit.none, // 不缩放，只对齐
                alignment: alignment,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '子',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '(${alignment.x}, ${alignment.y})',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class BoxFitVisualComparison extends StatelessWidget {
  final List<BoxFit> fits = [
    BoxFit.fill,
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fitWidth,
    BoxFit.fitHeight,
    BoxFit.none,
    BoxFit.scaleDown,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: fits.length,
      itemBuilder: (context, index) {
        final fit = fits[index];
        return _buildFitCard(fit);
      },
    );
  }

  Widget _buildFitCard(BoxFit fit) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 100,
            color: Colors.green[100],
            child: FittedBox(
              fit: fit,
              child: Container(
                width: 80,   // 故意设置非正方形
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Center(
                  child: Text(
                    '80x120',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  fit.toString().split('.').last,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  _getFitDescription(fit),
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getFitDescription(BoxFit fit) {
    switch (fit) {
      case BoxFit.fill:
        return '拉伸填充';
      case BoxFit.contain:
        return '保持比例显示';
      case BoxFit.cover:
        return '覆盖整个区域';
      case BoxFit.fitWidth:
        return '宽度适配';
      case BoxFit.fitHeight:
        return '高度适配';
      case BoxFit.none:
        return '不缩放';
      case BoxFit.scaleDown:
        return '需要时缩小';
    }
  }
}

class BoxFitExplanation extends StatelessWidget {
  final List<Map<String, dynamic>> fits = [
    {'name': 'BoxFit.fill', 'fit': BoxFit.fill, 'description': '拉伸填充，不保持比例'},
    {'name': 'BoxFit.contain', 'fit': BoxFit.contain, 'description': '保持比例，完全显示(默认)'},
    {'name': 'BoxFit.cover', 'fit': BoxFit.cover, 'description': '保持比例，覆盖整个区域'},
    {'name': 'BoxFit.fitWidth', 'fit': BoxFit.fitWidth, 'description': '宽度适配，高度按比例'},
    {'name': 'BoxFit.fitHeight', 'fit': BoxFit.fitHeight, 'description': '高度适配，宽度按比例'},
    {'name': 'BoxFit.none', 'fit': BoxFit.none, 'description': '不缩放，对齐显示'},
    {'name': 'BoxFit.scaleDown', 'fit': BoxFit.scaleDown, 'description': '只在需要时缩小'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('BoxFit 影响子组件如何适应 FittedBox 的空间',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ...fits.map((fitInfo) => _buildFitExample(
            fitInfo['name'] as String,
            fitInfo['description'] as String,
            fitInfo['fit'] as BoxFit,
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildFitExample(String name, String description, BoxFit fit) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 80,
            color: Colors.red[100],
            child: FittedBox(
              fit: fit,
              child: Container(
                width: 150,  // 原始尺寸
                height: 120,
                color: Colors.blue.withOpacity(0.7),
                child: Center(
                  child: Text(
                    '150 x 120',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FittedBoxCoreConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildComparison(
            '无 FittedBox - 溢出',
            Container(
              width: 150,
              height: 80,
              color: Colors.red,
              child: Container(
                width: 200, // 超出父容器
                height: 120,
                color: Colors.blue.withOpacity(0.4),
                child: Center(child: Text('溢出')),
              ),
            ),
          ),
          _buildComparison(
            '有 FittedBox - 自动缩放',
            Container(
              width: 150,
              height: 80,
              color: Colors.red,
              child: FittedBox(
                child: Container(
                  width: 200,
                  height: 120,
                  color: Colors.blue.withOpacity(0.5),
                  child: Center(child: Text('自动缩放')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparison(String title, Widget content) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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

class FittedBoxBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.red,
        //FittedBox 是一个可以根据自身尺寸调整子组件大小的组件，
        //类似于 CSS 中的 object-fit 属性，主要用于控制子组件的缩放和对齐方式。
        child: FittedBox(
          child: Container(
            width: 300, // 比父容器大，会被缩放
            height: 150,
            color: Colors.blue.withOpacity(0.2),
            child: Center(
              child: Text('被缩放的容器', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
