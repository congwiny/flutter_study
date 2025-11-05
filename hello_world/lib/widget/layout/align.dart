import 'package:flutter/material.dart';

class AlignExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align布局示例')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          const Text(
            '1. Align 基础示例',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AlignBasicExample(),
        ],
      ),
    );
  }
}

class AlignBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Center容器让子项获得松散约束
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.grey[200],
        //Align 是一个可以将子组件对齐到父组件任意位置的组件，它使用相对坐标系统进行定位。
        child: Align(
          alignment: Alignment.topRight, // 让子组件对齐到右上角
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: Center(child: Text('右上角')),
          ),
        ),
      ),
    );
  }
}
