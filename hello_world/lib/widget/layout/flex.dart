import 'package:flutter/material.dart';

class FlexExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flex弹性布局示例')),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1. Expanded 和 Flexible',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  FlexWidgetsExample(),
                  const Divider(height: 32),
                ],
            ),
        ),
    );
  }
}

class FlexWidgetsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('1. Expanded - 强制填充剩余空间'),
        Container(
          height: 60,
          child: Row(
            children: [
              Container(width: 50, color: Colors.red),
              Expanded(
                // 等价于 Flexible(fit: FlexFit.tight)
                // 占据所有剩余空间
                child: Container(color: Colors.blue),
              ),
              Container(width: 50, color: Colors.green),
            ],
          ),
        ),

        SizedBox(height: 20),
        Text('2. Flexible - 按 flex 权重分配空间'),
        Container(
          height: 60,
          child: Row(
            children: [
              //flex 权重（默认为 1）
              Flexible(flex: 1, child: Container(color: Colors.red)),
              // 占 2/3 剩余宽度
              Flexible(flex: 2, child: Container(color: Colors.green)),
              Flexible(flex: 1, child: Container(color: Colors.blue)),
            ],
          ),
        ),

        SizedBox(height: 20),
        Text('3. Flexible.fit 属性对比'),
        Container(
          height: 60,
          child: Row(
            children: [
              //flex 权重默认为 1
              Flexible(
                fit: FlexFit.loose, // 可以小于分配的空间
                child: Container(color: Colors.red, child: Text('你好')),
              ),
              //flex 权重默认为 1
              Flexible(
                fit: FlexFit.tight,
                // 根据两个Flexible权重，此Flexible分配的空间为 Row宽度 * 1/2
                child: Container(color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
