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
            FormTestRoute(),

            const Divider(height: 32),
            // 3. 动态表单验证
            const Text(
              '3. 动态表单验证',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            AsyncValidationField(),
          ],
        ),
      ),
    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  // 1. 创建 GlobalKey
  GlobalKey _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  final FocusNode nextFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    // 2. TextFormField包裹在 Form 中
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              icon: Icon(Icons.person),
            ),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },

            //onSaved：是 Form/FormField 的生命周期回调，
            //只有在你调用 FormState.save()（通常在验证通过后）时才按字段顺序被调用，
            //用于把字段的最终值写入你的数据模型（binding）。

            //当你调用 formKey.currentState!.save() 时，表单会对每个字段按顺序调用其 onSaved 回调，
            //把“最终值”交给你去写入 model/本地变量
            onSaved: (value) {
              //把表单最终值保存到_username变量
              _username = value;
              print('用户名保存的值: $value');
            },
            // onFieldSubmitted：此表单编辑完成的回调
            //（在用户通过键盘动作（例如按回车/Done/Enter）表示“编辑完成”时立即触发
            //常见用途：
            //1.当用户按回车直接发送消息或执行搜索（即时提交单条输入）。
            //2.在多字段表单里把焦点移动到下一个输入：
            //    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextFocusNode)。
            //3.做轻量的即时校验或触发动画等（注意不要做耗时/阻塞操作）。
            onFieldSubmitted:
                //把焦点移动到下一个输入
                (_) => FocusScope.of(context).requestFocus(nextFocus),
          ),
          TextFormField(
            focusNode: nextFocus,
            controller: _pwdController,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
            // 保存回调
            //Form/FormField 的生命周期回调，只有在你调用 FormState.save()（通常在验证通过后）时才按字段顺序被调用，
            //用于把字段的最终值写入你的数据模型（binding）。
            onSaved: (value) {
              _password = value;
              print('密码保存的值: $value');
            },

            onFieldSubmitted: (value) {
              print('密码表单编辑完成回调: $value');
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("登录"),
                    ),
                    onPressed: () {
                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验通过后再提交数据。
                      if ((_formKey.currentState as FormState).validate()) {
                        // 验证通过提交数据
                        // 触发所有表单字段的 onSaved
                        (_formKey.currentState as FormState).save();
                        // 这里可以使用 _username 去做后续工作
                        print(
                          "表单验证提交完成：username=$_username, password=$_password",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AsyncValidationField extends StatefulWidget {
  @override
  _AsyncValidationFieldState createState() => _AsyncValidationFieldState();
}

class _AsyncValidationFieldState extends State<AsyncValidationField> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isChecking = false;
  String? _asyncError;

  Future<String?> _checkEmailExists(String email) async {
    // 模拟网络请求
    await Future.delayed(Duration(seconds: 1));

    // 假设 admin@example.com 已被注册
    if (email.toLowerCase() == 'admin@example.com') {
      return '该邮箱已被注册';
    }
    return null;
  }

  Future<void> _validateEmail() async {
    setState(() => _isChecking = true);

    final error = await _checkEmailExists(_emailController.text);

    setState(() {
      _isChecking = false;
      _asyncError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '邮箱',
              errorText: _asyncError, // 显示异步错误
              suffixIcon: _isChecking ? CircularProgressIndicator() : null,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入邮箱';
              }
              // 同步验证邮箱格式
              final emailRegex = RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              );
              if (!emailRegex.hasMatch(value)) {
                return '邮箱格式不正确';
              }
              return null;
            },
            onChanged: (value) {
              // 输入变化时清除异步错误
              setState(() => _asyncError = null);
            },
            onFieldSubmitted: (value) async {
              // 提交时进行异步验证
              _validateEmail();
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // 先进行同步验证
              if (_formKey.currentState!.validate()) {
                // 再进行异步验证
                await _validateEmail();

                // 如果没有异步错误，提交表单
                if (_asyncError == null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('验证通过！')));
                }
              }
            },
            child: Text('提交'),
          ),
        ],
      ),
    );
  }
}
