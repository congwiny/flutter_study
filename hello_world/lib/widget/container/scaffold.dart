import 'package:flutter/material.dart';

class DrawerControlExample extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('抽屉控制示例'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(child: Text('左侧抽屉')),
      ),
      endDrawer: Drawer(
        child: Center(child: Text('右侧抽屉')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              child: Text('打开左侧抽屉'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              child: Text('打开右侧抽屉'),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('抽屉菜单示例')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 抽屉头部
            UserAccountsDrawerHeader(
              accountName: Text('张三'),
              accountEmail: Text('zhangsan@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  '张',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/300/200'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),

            // 菜单项
            _buildDrawerItem(Icons.home, '首页', () {}),
            _buildDrawerItem(Icons.person, '个人资料', () {}),
            _buildDrawerItem(Icons.settings, '设置', () {}),
            _buildDrawerItem(Icons.help, '帮助与反馈', () {}),

            Divider(),

            _buildDrawerItem(Icons.exit_to_app, '退出登录', () {}),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: Text(
                  '右侧抽屉',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('关于我们'),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('联系我们'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('左侧滑动打开抽屉菜单'),
            SizedBox(height: 20),
            Text('右侧滑动打开另一个抽屉'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class CustomAppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.star, color: Colors.yellow),
            SizedBox(width: 8),
            Text('自定义 AppBar'),
          ],
        ),
        actions: [
          Badge(
            label: Text('3'),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.purple[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text('自定义 AppBar 示例', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class AppBarProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 标题
        title: Text('AppBar 属性详解'),

        // 标题前的图标（通常是返回按钮）
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),

        // 操作按钮
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: '设置', child: Text('设置')),
              PopupMenuItem(value: '帮助', child: Text('帮助')),
            ],
          ),
        ],

        // 背景颜色
        backgroundColor: Colors.purple,

        // 前景颜色（图标和文字颜色）
        foregroundColor: Colors.white,

        // 阴影高度
        elevation: 8,

        // 标题间距
        titleSpacing: 20,

        // 工具栏高度
        toolbarHeight: 80,

        // 形状
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),

        // 是否显示在状态栏下方
        primary: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AppBar 常用属性:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildPropertyItem('title', '标题文本或组件'),
            _buildPropertyItem('leading', '标题前的图标'),
            _buildPropertyItem('actions', '右侧操作按钮列表'),
            _buildPropertyItem('backgroundColor', '背景颜色'),
            _buildPropertyItem('elevation', '阴影高度'),
            _buildPropertyItem('shape', '自定义形状'),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyItem(String name, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• $name:', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(description)),
        ],
      ),
    );
  }
}


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