import 'package:flutter/material.dart';

class SwitchAndCheckDemoPage extends StatelessWidget {
  const SwitchAndCheckDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch和CheckBox 组件示例')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchTestRoute(),
          ],
        ),
      ),
    );
  }
}

class SwitchTestRoute extends StatefulWidget {
  @override
  _SwitchTestRouteState createState() => _SwitchTestRouteState();
}

class _SwitchTestRouteState extends State<SwitchTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 1. Switch的简单使用和样式
        const Text(
          '1. Switch的简单使用和样式',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
          activeColor: Colors.green,                // 开启时滑块颜色
          activeTrackColor: Colors.lightGreen,      // 开启时轨道颜色
          inactiveThumbColor: Colors.grey,          // 关闭时滑块颜色
          inactiveTrackColor: Colors.grey.shade300, // 关闭时轨道颜色
          thumbColor: WidgetStateProperty.resolveWith((states) {
            // 更精细控制不同状态下的颜色（进阶）
            if (states.contains(WidgetState.selected)) {
              return Colors.blue;
            }
            return Colors.red;
          }),
        ),
        const Divider(height: 32),
        // 2. 使用 Switch.adaptive 适配不同平台
        const Text(
          '2. 使用 Switch.adaptive 适配不同平台',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Switch.adaptive(
          value: _switchSelected,
          onChanged: (bool newValue) {
            setState(() {
              _switchSelected = newValue;
            });
          },
          activeColor: Colors.green,
        )

      ],
    );
  }
}
