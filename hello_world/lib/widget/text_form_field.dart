import 'package:flutter/material.dart';

//TextField：基础输入组件
//TextFormField：专为表单设计，必须配合 Form widget 使用

class TextFormFieldDemoPage extends StatelessWidget {
  const TextFormFieldDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextFormField 使用大全')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 最简单的使用
            const Text(
              '1. 最简单的 TextFormField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(),

            const Divider(height: 32),
            // 2. 基础表单集成
            const Text(
              '2. 基础表单集成',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            BasicForm(),
          ],
        ),
      ),
    );
  }
}

//TextFormField 必须放在 Form 中，并通过 GlobalKey<FormState> 控制整个表单：
class BasicForm extends StatelessWidget {
  // 1. 创建 GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 2. TextFormField包裹在 Form 中
    return Form(
      key: _formKey, //必须设置 key
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 3. 验证表单
              if (_formKey.currentState!.validate()) {
                // 表单验证通过
              }
            },
            child: Text('提交'),
          ),
        ],
      ),
    );
  }
}
