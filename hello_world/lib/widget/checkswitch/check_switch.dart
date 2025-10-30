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
          children: [SwitchTestRoute()],
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
      children: <Widget>[
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
      ],
    );
  }
}
