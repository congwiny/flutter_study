import 'package:flutter/material.dart';

//TextField 是 Flutter 中最常用的文本输入组件，用于接收用户的文本输入。
//它提供了丰富的配置选项和交互功能。
class TextFieldDemoPage extends StatelessWidget {
  const TextFieldDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField 使用大全')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 最简单的使用
            const Text(
              '1. 最简单的TextField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(),

            const Divider(height: 32),

            // 2. 基础配置
            const Text(
              '2. InputDecoration基础配置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                border: OutlineInputBorder(),
              ),
            ),

            const Divider(height: 32),

            // 3. 核心装饰属性详解
            const Text(
              '3. InputDecoration核心装饰属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                // 标签文本
                labelText: '邮箱地址',
                // 提示文本
                hintText: 'example@email.com',
                // 前缀图标
                prefixIcon: Icon(Icons.email),
                // 后缀图标
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                // 边框样式
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                // 聚焦时的边框样式
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                // 错误时的边框样式
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                // 标签样式
                labelStyle: TextStyle(color: Colors.pink),
                // 提示文本样式
                hintStyle: TextStyle(color: Colors.orange[400]),
                // 填充颜色
                fillColor: Colors.purple[50],
                filled: true,
                // 内容边距
                contentPadding: EdgeInsets.all(16),
              ),
            ),
            const Divider(height: 32),

            // 4. 文本控制属性
            const Text(
              '4. 文本控制属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            TextField(
              // 控制器
              controller: TextEditingController(),
              // 初始值
              // controller.text = '初始值', // 在代码中设置
              // 最大行数
              maxLines: 1, // 单行输入
              // maxLines: null, // 多行输入，无限行
              // maxLines: 5, // 限制最多5行

              // 最小行数
              minLines: 1,
              // 最大字符数
              maxLength: 50,
              // 是否显示字符计数
              obscureText: false, // 设置为true用于密码输入
              // 密码字符
              obscuringCharacter: '*', // 默认是圆点
            ),

            const Divider(height: 32),

            // 5. 键盘和输入属性
            const Text(
              '5. 键盘和输入属性',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            TextField(
              // 键盘类型
              keyboardType: TextInputType.text, // 文本键盘
              // keyboardType: TextInputType.emailAddress, // 邮箱键盘
              // keyboardType: TextInputType.phone, // 电话键盘
              // keyboardType: TextInputType.number, // 数字键盘
              // keyboardType: TextInputType.multiline, // 多行文本键盘

              // 键盘动作按钮
              textInputAction: TextInputAction.done, // 完成
              // textInputAction: TextInputAction.next, // 下一个
              // textInputAction: TextInputAction.search, // 搜索
              // textInputAction: TextInputAction.send, // 发送

              // 文本对齐方式
              textAlign: TextAlign.start,
              // 文本方向
              textDirection: TextDirection.ltr,
              // 文本样式
              style: TextStyle(fontSize: 16, color: Colors.black),
              // 自动对焦
              autofocus: false,
            ),
            const Divider(height: 32),

            // 6. 控制器（TextEditingController）
            const Text(
              '6. 控制器（TextEditingController）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            TextFieldWithController(),

            const Divider(height: 32),

            // 7. 焦点控制（FocusNode）
            const Text(
              '7.焦点控制（FocusNode）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            FocusableTextField(),
          ],
        ),
      ),
    );
  }
}

class TextFieldWithController extends StatefulWidget {
  @override
  _TextFieldWithControllerState createState() =>
      _TextFieldWithControllerState();
}

class _TextFieldWithControllerState extends State<TextFieldWithController> {
  final TextEditingController _controller = TextEditingController();
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    // 监听文本变化
    _controller.addListener(() {
      setState(() {
        _currentText = _controller.text;
      });
    });

    // 设置初始值（可选）
    _controller.text = '初始文本';
  }

  void _clearText() {
    _controller.clear();
  }

  void _setText() {
    _controller.text = '预设文本';
  }

  void _getSelection() {
    print('选中文本: ${_controller.selection}');
    print(
      '选中内容: ${_controller.text.substring(_controller.selection.start, _controller.selection.end)}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: '带控制器的输入框',
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: _clearText, //删除按钮点击事件
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('当前文本: $_currentText'),
        Row(
          children: [
            ElevatedButton(onPressed: _setText, child: Text('设置文本')), //设置文本点击事件
            SizedBox(width: 10),
            ElevatedButton(onPressed: _getSelection, child: Text('获取选择')),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FocusableTextField extends StatefulWidget {
  @override
  _FocusableTextFieldState createState() => _FocusableTextFieldState();
}

class _FocusableTextFieldState extends State<FocusableTextField> {
  //创建 FocusNode
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  //创建控制器
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听焦点变化
    _focusNode1.addListener(() {
      print('输入框1焦点状态: ${_focusNode1.hasFocus}');
    });
  }

  void _moveToNextField() {
    _focusNode1.unfocus(); //取消焦点
    FocusScope.of(context).requestFocus(_focusNode2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: _focusNode1,
          controller: _controller1,
          textInputAction: TextInputAction.next,
          onSubmitted: (value) => _moveToNextField(),
          decoration: InputDecoration(labelText: '第一个输入框'),
        ),
        SizedBox(height: 16),
        TextField(
          focusNode: _focusNode2,
          controller: _controller2,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: '第二个输入框'),
        ),
        ElevatedButton(
          onPressed: () {
            _focusNode1.requestFocus(); //请求焦点
          },
          child: Text('聚焦到第一个输入框'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
