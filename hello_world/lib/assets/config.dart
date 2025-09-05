import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ConfigLoader {
  // 从资源加载JSON配置
  static Future<Map<String, dynamic>> loadConfig() async {
    try {
      final String configString = await rootBundle.loadString(
        'json/config.json',
      );
      return jsonDecode(configString);
    } catch (e) {
      print('加载配置文件失败: $e');
      return {};
    }
  }
}

class ConfigExample extends StatefulWidget {
  @override
  _ConfigExampleState createState() => _ConfigExampleState();
}

class _ConfigExampleState extends State<ConfigExample> {
  Map<String, dynamic> _config = {};

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final config = await ConfigLoader.loadConfig();
    setState(() {
      _config = config;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('配置文件示例')),
      body: Center(
        child:
            _config.isEmpty
                ? CircularProgressIndicator()
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('应用名称: ${_config['appName'] ?? '未知'}'),
                    Text('版本: ${_config['version'] ?? '未知'}'),
                    Text('API地址: ${_config['apiUrl'] ?? '未知'}'),
                  ],
                ),
      ),
    );
  }
}
