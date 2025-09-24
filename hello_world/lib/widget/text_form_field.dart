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
