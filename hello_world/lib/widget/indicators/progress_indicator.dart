import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProgressIndicator 组件示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. LinearProgressIndicator
            const Text(
              '1. LinearProgressIndicator不确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const LinearProgressIndicator(),
            const Divider(height: 32),
            // 2. LinearProgressIndicator确定进度
            const Text(
              '2. LinearProgressIndicator确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(
              value: 0.6,
              // 当前进度值，null 表示不确定进度
              color: Colors.green,
              //进度条颜色
              backgroundColor: Colors.grey[300],
              // 背景条颜色
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              // 进度条颜色
              minHeight: 8, //进度条高度（默认 6.0）
            ),
            const Divider(height: 32),
            // 3. 模拟文件下载（确定进度）
            const Text(
              '3. 模拟文件下载（确定进度）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DownloadProgressExample(),
            const Divider(height: 32),
            // 1. CircularProgressIndicator不确定进度（默认）：
            const Text(
              '1. CircularProgressIndicator不确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(),
            const Divider(height: 32),
            // 2. CircularProgressIndicator确定进度：
            const Text(
              '2. CircularProgressIndicator确定进度',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey[200],
              //使用 AlwaysStoppedAnimation 固定颜色：
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              strokeWidth: 4, // 线条宽度
              strokeCap: StrokeCap.round, // 线条端点样式
            ),
            const Divider(height: 32),
            // 3. 表单提交加载状态：
            const Text(
              '3. 表单提交加载状态',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FormSubmitExample()
          ],
        ),
      ),
    );
  }
}

class DownloadProgressExample extends StatefulWidget {
  @override
  _DownloadProgressExampleState createState() => _DownloadProgressExampleState();
}

class _DownloadProgressExampleState extends State<DownloadProgressExample> {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;

  void _simulateDownload() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    // 模拟下载过程
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 50));
      setState(() {
        _downloadProgress = i / 100;
      });
    }

    setState(() {
      _isDownloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '文件下载',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${(_downloadProgress * 100).toInt()}%'),
                  ],
                ),
                SizedBox(height: 12),
                LinearProgressIndicator(
                  value: _downloadProgress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 8,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('文件大小: 50MB'),
                    Text('速度: 1.2MB/s'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isDownloading ? null : _simulateDownload,
          child: Text(_isDownloading ? '下载中...' : '开始下载'),
        ),
      ],
    );
  }
}

class FormSubmitExample extends StatefulWidget {
  @override
  _FormSubmitExampleState createState() => _FormSubmitExampleState();
}

class _FormSubmitExampleState extends State<FormSubmitExample> {
  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    setState(() {
      _isSubmitting = true;
    });

    // 模拟网络请求
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isSubmitting = false;
    });

    // 显示成功消息
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('提交成功!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: '用户名',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isSubmitting ? null : _submitForm,
            child: _isSubmitting
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Text('提交中...'),
              ],
            )
                : Text('登录'),
          ),
        ),
      ],
    );
  }
}