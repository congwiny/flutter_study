import 'package:flutter/material.dart';

class LayoutBuilderExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayoutBuilder布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. LayoutBuilder 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LayoutBuilderBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. BoxConstraints 示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BoxConstraintsExplanation(),
            const Divider(height: 32),
            const Text(
              '3. 获取约束信息',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ConstraintsInfoExample(),
          ],
        ),
      ),
    );
  }
}


class ResponsiveCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const ResponsiveCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth > 300;

        return Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(isWide ? 20 : 16),
            child: isWide ? _buildWideLayout() : _buildCompactLayout(),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompactLayout() {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ResponsiveCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义响应式组件')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 宽卡片
            Container(
              width: 400,
              margin: EdgeInsets.only(bottom: 16),
              child: ResponsiveCard(
                title: '功能特性',
                content: '这是一个宽卡片布局，当有足够空间时会显示图标和文本的水平排列。',
                icon: Icons.star,
              ),
            ),
            // 窄卡片
            Container(
              width: 200,
              margin: EdgeInsets.only(bottom: 16),
              child: ResponsiveCard(
                title: '设置选项',
                content: '这是一个窄卡片布局，空间有限时会切换到垂直排列。',
                icon: Icons.settings,
              ),
            ),
            // 自适应宽度卡片
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * 0.8,
                  child: ResponsiveCard(
                    title: '自适应卡片',
                    content: '这个卡片的宽度是父容器宽度的80%，会根据可用空间自动调整布局。',
                    icon: Icons.auto_awesome,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConstraintsInfoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.blue[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard('最大宽度', '${constraints.maxWidth}'),
              _buildInfoCard('最大高度', '${constraints.maxHeight}'),
              _buildInfoCard('最小宽度', '${constraints.minWidth}'),
              _buildInfoCard('最小高度', '${constraints.minHeight}'),
              _buildInfoCard('是否有界宽度', '${constraints.hasBoundedWidth}'),
              _buildInfoCard('是否有界高度', '${constraints.hasBoundedHeight}'),
              _buildInfoCard(
                  '是否有紧约束宽度', '${constraints.hasTightWidth}'),
              _buildInfoCard(
                  '是否有紧约束高度', '${constraints.hasTightHeight}'),
              _buildInfoCard(
                  '是否无限宽度', '${constraints.maxWidth.isInfinite}'),
              _buildInfoCard(
                  '是否无限高度', '${constraints.maxHeight.isInfinite}'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Text('$title:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Text(value, style: TextStyle(fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }
}

class BoxConstraintsExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BoxConstraints 属性:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildConstraintItem('minWidth', '最小宽度约束'),
        _buildConstraintItem('maxWidth', '最大宽度约束'),
        _buildConstraintItem('minHeight', '最小高度约束'),
        _buildConstraintItem('maxHeight', '最大高度约束'),
        SizedBox(height: 20),
        Text('约束类型:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildConstraintTypeExample(),
      ],
    );
  }

  Widget _buildConstraintItem(String name, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text('• $name:', style: TextStyle(fontFamily: 'monospace')),
          SizedBox(width: 8),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildConstraintTypeExample() {
    return Column(
      children: [
        _buildConstraintExample(
          '严格约束 (Tight)',
          'minWidth == maxWidth\nminHeight == maxHeight',
          BoxConstraints.tight(Size(100, 50)),
        ),
        _buildConstraintExample(
          '宽松约束 (Loose)',
          'minWidth = 0, minHeight = 0\n有最大宽度和高度',
          BoxConstraints.loose(Size(200, 100)),
        ),
        // _buildConstraintExample(
        //   '扩展约束 (Expand)',
        //   '无限宽高可用空间',
        //   BoxConstraints.expand(),
        // ),
        _buildConstraintExample(
          '有界约束 (Bounded)',
          '有明确的最小和最大范围',
          BoxConstraints(minWidth: 50, maxWidth: 150, minHeight: 30, maxHeight: 80),
        ),
      ],
    );
  }

  Widget _buildConstraintExample(String title, String description,
      BoxConstraints constraints) {
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 12)),
            SizedBox(height: 8),
            Text(
              '约束: $constraints',
              style: TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
            ConstrainedBox(constraints: constraints,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ));
  }
}

class LayoutBuilderBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey[200],
      //Center容器让LayoutBuilder获得松散约束
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.6,
              color: Colors.blue,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Text(
                      '宽度: ${constraints.maxWidth}\n高度: ${constraints.maxHeight}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
