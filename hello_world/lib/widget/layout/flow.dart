import 'dart:math' as math;

import 'package:flutter/material.dart';

///Flow 是一个高性能的自定义布局组件，需要实现 FlowDelegate 来控制子组件的布局。
///Flow组件需要自己计算每个子组件的位置，所以适合实现一些自定义的布局效果，如圆形布局、瀑布流等。
///Flow的性能更好，因为它不会对子组件进行多次布局，而是直接绘制。但是，Wrap在布局过程中会测量子组件并自动换行，更易用。
///Flow可以实现任何自定义布局，而Wrap只能实现流式布局。

class FlowExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow布局示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Flow 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //Flow组件需要两个参数：
            // delegate：一个FlowDelegate的子类，用于控制子组件的布局。
            // children：子组件列表。
            Flow(
              delegate: SimpleFlowDelegate(),
              children: List.generate(
                6,
                (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '$index',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 32),
            const Text(
              '2. 圆形 Flow 布局',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CircularFlowExample()
          ],
        ),
      ),
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  ///FlowDelegate需要实现两个方法：
  /// void paintChildren(FlowPaintingContext context)：用于绘制子组件，可以在这里对子组件进行变换（如平移、旋转等）和绘制。
  /// Size getSize(BoxConstraints constraints)：返回Flow的尺寸。

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    double maxHeight = 0;

    for (int i = 0; i < context.childCount; i++) {
      // 获取子组件尺寸
      final childSize = context.getChildSize(i)!;

      // 如果当前行放不下，换行
      if (x + childSize.width > context.size.width) {
        x = 0;
        y += maxHeight + 10;
        maxHeight = 0;
      }

      // 绘制子组件
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));

      // 更新位置
      x += childSize.width + 10;
      if (childSize.height > maxHeight) {
        maxHeight = childSize.height;
      }
    }
  }

  //确定是否需要重绘。
  @override
  bool shouldRepaint(SimpleFlowDelegate oldDelegate) => false;

  //Flow组件不会自动调整大小，需要自己在getSize中返回合适的尺寸。
  @override
  Size getSize(BoxConstraints constraints) {
    // 计算所需尺寸
    return Size(constraints.maxWidth, 200);
  }
}


class CircularFlowDelegate extends FlowDelegate {
  final Animation<double> animation;

  CircularFlowDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    final double radius = 100;
    final double angle = 2 * 3.14159 / context.childCount;

    for (int i = 0; i < context.childCount; i++) {
      // 计算位置（圆形排列）
      final double x = radius * (1 + math.cos(i * angle - animation.value * 2 * 3.14159));
      final double y = radius * (1 + math.sin(i * angle - animation.value * 2 * 3.14159));

      // 计算缩放（根据动画值）
      final double scale = 0.5 + 0.5 * animation.value;

      final transform = Matrix4.identity()
        ..translate(x, y)
        ..scale(scale);

      context.paintChild(i, transform: transform);
    }
  }

  @override
  bool shouldRepaint(CircularFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(300, 300);
  }
}

class CircularFlowExample extends StatefulWidget {
  @override
  _CircularFlowExampleState createState() => _CircularFlowExampleState();
}

class _CircularFlowExampleState extends State<CircularFlowExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
          delegate: CircularFlowDelegate(animation: _controller.view),
          children: List.generate(8, (index) => Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )),
        );
  }
}


class TagSelectorExample extends StatefulWidget {
  @override
  _TagSelectorExampleState createState() => _TagSelectorExampleState();
}

class _TagSelectorExampleState extends State<TagSelectorExample> {
  final List<String> allTags = [
    'Flutter', 'Dart', 'Widget', 'Layout', 'Animation',
    'State', 'Provider', 'Bloc', 'HTTP', 'Database'
  ];

  final List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('标签选择器')),
      body: Column(
        children: [
          // 已选标签
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('已选标签:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: selectedTags.map((tag) => Chip(
                    label: Text(tag),
                    onDeleted: () => setState(() => selectedTags.remove(tag)),
                  )).toList(),
                ),
              ],
            ),
          ),

          Divider(),

          // 所有标签
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('所有标签:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: allTags.map((tag) => FilterChip(
                          label: Text(tag),
                          selected: selectedTags.contains(tag),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedTags.add(tag);
                              } else {
                                selectedTags.remove(tag);
                              }
                            });
                          },
                        )).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}