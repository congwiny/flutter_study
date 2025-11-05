import 'package:flutter/material.dart';

/// Stack 是一个层叠布局容器，允许其子组件在垂直方向上堆叠显示。子组件可以部分或完全重叠，类似于 CSS 中的绝对定位（position: absolute）。
class StackExamplePage extends StatelessWidget {
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
            const Text(
              '3. Stack Fit属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            StackFitExample(),
            const Divider(height: 32),
            const Text(
              '4.Stack clipBehavior属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // 默认裁剪（Clip.hardEdge）
            _buildClipBehavior(Clip.hardEdge, 'Clip.hardEdge（默认）'),
            // 不裁剪
            _buildClipBehavior(Clip.none, 'Clip.none（不裁剪）'),
            const Divider(height: 32),
            const Text(
              '5. IndexedStack 控制显示层级',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IndexedStackExample(),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildClipBehavior(Clip clipBehavior, String label) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          margin: const EdgeInsets.all(20),
          color: Colors.grey[300],
          // Stack 宽高固定为 150x150
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              clipBehavior: clipBehavior, // 关键属性
              children: [
                Container(color: Colors.blue.withOpacity(0.3)),
                // 故意让子组件超出边界
                Positioned(
                  top: -20,
                  left: -20,
                  child: Container(width: 60, height: 60, color: Colors.red),
                ),
                Positioned(
                  bottom: -30,
                  right: -10,
                  child: Container(width: 40, height: 40, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IndexedStackExample extends StatefulWidget {
  @override
  _IndexedStackExampleState createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 控制按钮
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _currentIndex = 0),
              child: Text('显示红色'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _currentIndex = 1),
              child: Text('显示绿色'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _currentIndex = 2),
              child: Text('显示蓝色'),
            ),
          ],
        ),

        SizedBox(height: 20),

        // IndexedStack
        Container(
          width: 200,
          height: 200,
          child: IndexedStack(
            index: _currentIndex,
            children: [
              // 只有当前索引对应的组件会显示
              Container(color: Colors.red, child: Center(child: Text('红色层', style: TextStyle(color: Colors.white)))),
              Container(color: Colors.green, child: Center(child: Text('绿色层', style: TextStyle(color: Colors.white)))),
              Container(color: Colors.blue, child: Center(child: Text('蓝色层', style: TextStyle(color: Colors.white)))),
            ],
          ),
        ),

        SizedBox(height: 20),
        Text('当前显示: 索引 $_currentIndex'),
      ],
    );
  }
}

/////fit 是 Stack 组件中一个非常重要但容易被忽视的属性，它直接决定了 Stack 自身尺寸（width/height）如何计算，进而影响整个布局的表现。
/// fit 属性的本质作用: fit 控制的是：Stack 容器本身的大小（size）是如何被确定的。
/// fit 的类型是 StackFit，它有三个可选值：StackFit.loose（默认值）, StackFit.expand, StackFit.passthrough（较少使用）

class StackFitExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // StackFit.loose行为规则：
        //    Stack 的尺寸仅由非 Positioned 的子组件决定。
        //    Positioned 子组件完全不影响 Stack 的大小。
        //    如果没有任何非 Positioned 子组件，则 Stack 的尺寸为 0×0。
        //一句话记住 : 我有多大，看我的“普通孩子”（非 Positioned）。

        //StackFit.loose 适用场景：
        //    你有一个明确的“背景”或“容器”作为非 Positioned 子组件。
        //    你想让 Stack 的大小“包裹”住主要内容区域。
        Stack(
          fit: StackFit.loose, // 默认，可省略
          children: [
            Container(width: 200, height: 150, color: Colors.grey), // ← 非 Positioned
            Positioned(top: 10, left: 10, child: Text("Hello")),
          ],
        ),

        //// ❌ Stack 尺寸 = 0×0！文字和图标虽然存在，但 Stack 本身没有空间 → 可能看不见！
        // Stack(
        //   fit: StackFit.loose,
        //   children: [
        //     Positioned(top: 10, left: 10, child: Text("Hello2")),
        //     Positioned(bottom: 20, right: 30, child: Icon(Icons.star)),
        //   ],
        // ),

        SizedBox(height: 20),

        // StackFit.expand 行为规则：
        //    Stack 会尽可能扩展，以填满父容器提供的最大约束（max width/height）。
        //    即使没有子组件，或者只有 Positioned 子组件，Stack 也会撑满可用空间。
        //    要求父 widget 必须提供明确的最大尺寸约束（如 SizedBox、Container with width/height、Center、Column/Row 中的 Expanded 等）。否则会抛出异常！
        //    子组件的宽高受到StackFit.expand的影响，填充满 Stack

        //一句话记住 : 我要占满爸爸给我的所有空间（但爸爸必须告诉我有多大）。

        // StackFit.expand 适用场景：
        //    你想让 Stack 全屏覆盖（如弹窗背景、封面图层叠）。
        //    所有内容都是通过 Positioned 精确定位的，不需要“背景容器”。
        // 正确用法：父容器提供了约束
        Container(
          color: Colors.grey,
          width: 300,
          height: 200,
          child: Stack(
            fit: StackFit.expand, //设置了StackFit.expand，那么绿色的子组件的宽高就被设置为 Stack的宽高
            children: [
              Container(color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
            ],
          ),
        )

      ],
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
