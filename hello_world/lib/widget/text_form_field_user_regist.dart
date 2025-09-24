import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;

  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
  });
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户注册')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: ListView(
            children: [
              // 姓名
              TextFormField(
                decoration: InputDecoration(
                  labelText: '姓名 *',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSaved: (value) => _user.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入姓名';
                  }
                  if (value.length < 2) {
                    return '姓名至少2个字符';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),

              // 邮箱
              TextFormField(
                decoration: InputDecoration(
                  labelText: '邮箱 *',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _user.email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入邮箱';
                  }
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return '邮箱格式不正确';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),

              // 手机号
              TextFormField(
                decoration: InputDecoration(
                  labelText: '手机号',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                onSaved: (value) => _user.phone = value,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (value.length != 11) {
                      return '手机号必须是11位数字';
                    }
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),

              // 密码
              TextFormField(
                decoration: InputDecoration(
                  labelText: '密码 *',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                obscureText: _obscurePassword,
                onSaved: (value) => _user.password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  if (value.length < 6) {
                    return '密码至少6位';
                  }
                  if (!RegExp(
                    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{6,}$',
                  ).hasMatch(value)) {
                    return '密码必须包含字母和数字';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),

              // 确认密码
              TextFormField(
                decoration: InputDecoration(
                  labelText: '确认密码 *',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                obscureText: _obscureConfirmPassword,
                onSaved: (value) => _user.confirmPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请确认密码';
                  }
                  if (value != _user.password) {
                    return '两次密码不一致';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 30),

              // 按钮组
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('注册', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetForm,
                      child: Text('重置', style: TextStyle(fontSize: 16)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // 模拟提交
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('注册成功'),
              content: Text('用户: ${_user.name}\n邮箱: ${_user.email}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text('确定'),
                ),
              ],
            ),
      );
    } else {
      // 验证失败，启用自动验证
      setState(() {
        _autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _autoValidateMode = AutovalidateMode.disabled;
      _obscurePassword = true;
      _obscureConfirmPassword = true;
    });
  }
}
