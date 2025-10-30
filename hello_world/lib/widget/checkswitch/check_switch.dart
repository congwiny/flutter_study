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
            const Divider(height: 32),
            CheckboxTestRoute()
          ],
        ),
      ),
    );
  }
}

class CheckboxTestRoute extends StatefulWidget {
  @override
  _CheckboxTestRouteState createState() => _CheckboxTestRouteState();
}

class _CheckboxTestRouteState extends State<CheckboxTestRoute> {
  bool _isChecked = false;
  bool? _tristateValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1. Checkbox的简单使用和样式
          const Text(
            '1. Checkbox的简单使用和样式',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Checkbox(
            value: _isChecked,
            onChanged: (value) => setState(() => _isChecked = value!),
            checkColor: Colors.white,
            // 勾选符号颜色
            activeColor: Colors.green,
            // 选中背景色
            side: BorderSide( // 未选中时边框
              color: Colors.blue,
              width: 2,
            ),
            shape: RoundedRectangleBorder( // 圆角矩形（默认是圆）
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Divider(height: 32),

          // 2. 三态 Checkbox
          const Text(
            '2. 三态 Checkbox',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Checkbox(
            value: _tristateValue,
            tristate: true,
            onChanged: (bool? newValue) {
              _handleTristateChange(newValue);
            },
          )
        ]
    );
  }

  void _handleTristateChange(bool? newValue) {
    setState(() {
      if (_tristateValue == false) {
        _tristateValue = true;      // 未选中 -> 选中
      } else if (_tristateValue == true) {
        _tristateValue = null;      // 选中 -> 部分选中
      } else {
        _tristateValue = false;     // 部分选中 -> 未选中
      }
    });
  }
}

class SwitchTestRoute extends StatefulWidget {
  @override
  _SwitchTestRouteState createState() => _SwitchTestRouteState();
}

class _SwitchTestRouteState extends State<SwitchTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _isSwitchEnabled = false;
  bool _darkModeEnabled = true;

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
        ),
        const Divider(height: 32),
        // 3. Switch禁用状态
        const Text(
          '3. Switch禁用状态',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: _switchSelected,
          onChanged: _isSwitchEnabled ? (bool newValue) {
            setState(() {
              _switchSelected = newValue;
            });
          } : null, // onChanged 为 null 时禁用
        ),
        const Divider(height: 32),
        // 4. Switch 的典型应用
        const Text(
          '4. Switch 的典型应用',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildSettingItem(
          title: '夜间模式',
          subtitle: '启用深色主题',
          value: _darkModeEnabled,
          onChanged: (value) {
            setState(() {
              _darkModeEnabled = value;
            });
          },
        ),
      ],
    );
  }
}


Widget _buildSettingItem({
  required String title,
  required String subtitle,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return ListTile(
    leading: Icon(Icons.settings),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Switch(
      value: value,
      onChanged: onChanged,
    ),
    onTap: () {
      onChanged(!value);
    },
  );
}