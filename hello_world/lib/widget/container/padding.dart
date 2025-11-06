import 'package:flutter/material.dart';

class PadddingExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding示例')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Padding 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PaddingBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. EdgeInsets 的多种构造方法',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            EdgeInsetsConstructors(),
            const Divider(height: 32),
            const Text(
              '4. 复杂布局中的嵌套 Padding',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            NestedPaddingExample()
          ],
        ),
      ),
    );
  }
}

class NestedPaddingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.all(20), // 外层边距
        child: Card(
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.all(16), // 卡片内边距
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '用户信息',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // 用户头像部分
                Padding(
                  padding: EdgeInsets.only(bottom: 12), // 头像底部边距
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                            Icons.person, color: Colors.white, size: 30),
                      ),
                      SizedBox(width: 16), // 使用 SizedBox 作为间距
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('张三',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('高级用户',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 信息详情部分
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8), // 详情上下边距
                  child: Column(
                    children: [
                      _buildInfoRow('邮箱', 'zhangsan@example.com'),
                      _buildInfoRow('电话', '+86 138 0013 8000'),
                      _buildInfoRow('地址', '北京市朝阳区'),
                    ],
                  ),
                ),
                // 按钮部分
                Padding(
                  padding: EdgeInsets.only(top: 16), // 按钮顶部边距
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8), // 按钮间间距
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('编辑资料'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8), // 按钮间间距
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('取消'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}

class EdgeInsetsConstructors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0), // 所有方向添加16像素内边距
        child: Column(
          children: [
            _buildExample(
              '1. EdgeInsets.all(double value)',
              '所有方向相同的边距',
              EdgeInsets.all(20),
              Colors.red[100]!,
            ),
            _buildExample(
              '2. EdgeInsets.symmetric({double vertical, double horizontal})',
              '对称边距：垂直和水平方向',
              EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              Colors.green[100]!,
            ),
            _buildExample(
              '3. EdgeInsets.only({double left, top, right, bottom})',
              '只设置指定的边距',
              EdgeInsets.only(left: 40, top: 10, right: 20, bottom: 5),
              Colors.blue[100]!,
            ),
            _buildExample(
              '4. EdgeInsets.fromLTRB(double left, double top, double right, double bottom)',
              '分别设置左、上、右、下边距',
              EdgeInsets.fromLTRB(15, 25, 35, 5),
              Colors.orange[100]!,
            ),
            _buildExample(
              '5. EdgeInsets.zero',
              '无边距',
              EdgeInsets.zero,
              Colors.purple[100]!,
            ),
            _buildExample(
              '6. EdgeInsets.fromWindowPadding(WindowPadding padding, double devicePixelRatio)',
              '从窗口边距创建（用于处理系统UI）',
              EdgeInsets.fromWindowPadding(
                WidgetsBinding.instance.window.viewPadding,
                WidgetsBinding.instance.window.devicePixelRatio,
              ),
              Colors.teal[100]!,
            ),
          ],
        ));
  }

  Widget _buildExample(String title, String description, EdgeInsets padding, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: padding,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                color: color,
                child: Text(
                  'padding: $padding',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaddingBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey[300],
        //Padding 是一个基础布局组件，用于在子组件周围添加内边距。
        child: Padding(
          padding: EdgeInsets.all(20.0), // 所有方向添加20像素内边距
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Text('有内边距的容器', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
