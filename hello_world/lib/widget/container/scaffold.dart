import 'package:flutter/material.dart';

class ScaffoldStructure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 应用栏（顶部）
      appBar: AppBar(
        title: Text('Scaffold 结构'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),

      // 2. 左侧抽屉
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('抽屉头部'),
            ),
            ListTile(title: Text('菜单项1')),
            ListTile(title: Text('菜单项2')),
          ],
        ),
      ),

      // 3. 右侧抽屉
      endDrawer: Drawer(
        child: Center(child: Text('右侧抽屉')),
      ),

      // 4. 主要内容区域
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Text('主要内容区域'),
        ),
      ),

      // 5. 悬浮操作按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      // 6. 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '业务'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '学习'),
        ],
      ),
    );
  }
}

class ScaffoldBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('基础 Scaffold 示例'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            '欢迎使用 Scaffold!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}