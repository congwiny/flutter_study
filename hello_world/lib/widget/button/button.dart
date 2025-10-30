import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button 组件示例')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ElevatedButton（凸起按钮）
            const Text(
              '1. ElevatedButton（凸起按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                print('按钮被点击了！');
              },
              onLongPress: () {
                print('按钮被长按了！');
              },
              //styleFrom() 是静态工厂方法，用于快速创建 ButtonStyle
              style: ElevatedButton.styleFrom(
                //文字/图标颜色
                foregroundColor: Colors.red,
                // 背景色
                backgroundColor: Colors.blue,
                // 阴影高度（0~24）
                elevation: 5,
                // 内边距
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                // 形状
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 圆角
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.add), SizedBox(width: 8), Text('添加项目')],
              ),
            ),
            const Divider(height: 32),
            // 2.  TextButton（文本按钮）
            const Text(
              '2. TextButton（文本按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                print('文本按钮被点击了！');
              },
              onLongPress: () {
                print('文本按钮被长按了！');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // 文字颜色
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline, // 下划线
                ),
              ),
              child: Text('自定义文本按钮'),
            ),
            const Divider(height: 32),
            // 3. OutlinedButton（轮廓按钮）
            const Text(
              '3. OutlinedButton（轮廓按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              onPressed: () {
                print('轮廓按钮被点击了！');
              },
              onLongPress: () {
                print('轮廓按钮被长按了！');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green, width: 2), // 边框样式
                foregroundColor: Colors.green, // 文字颜色
                shape: StadiumBorder(), // 超椭圆边框（胶囊形）
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              child: Text('自定义描边按钮'),
            ),
            const Divider(height: 32),
            // 4. IconButton（图标按钮）
            const Text(
              '4. IconButton（图标按钮）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                print('图标按钮被点击');
              },
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 30,
            ),
            const Divider(height: 32),
            // 5. ElevatedButton的状态切换
            const Text(
              '5. ElevatedButton的状态切换',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedStateButton(),
            const Divider(height: 32),
            // 6. 带图标的按钮
            const Text(
              '6. 带图标的按钮',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                  label: Text('保存'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  label: Text('分享'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: Text('删除'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedStateButton extends StatefulWidget {
  const ElevatedStateButton({super.key});

  @override
  State<ElevatedStateButton> createState() => _ElevatedButtonState();
}

class _ElevatedButtonState extends State<ElevatedStateButton> {
  bool isElevatedEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          //onPressed：点击回调（必填，若为 null 则按钮禁用）
          onPressed: isElevatedEnabled ? () => print('Elevated') : null,
          child: isElevatedEnabled ? const Text('已启用') : const Text('已禁用'),
        ),
        const SizedBox(height: 10),
        // 切换启用状态
        ElevatedButton(
          onPressed: () {
            setState(() {
              isElevatedEnabled = !isElevatedEnabled;
            });
          },
          child: Text(isElevatedEnabled ? '禁用上方按钮' : '启用上方按钮'),
        ),
      ],
    );
  }
}
