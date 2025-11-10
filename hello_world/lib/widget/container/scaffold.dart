import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义底部导航栏')),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Text(
            '当前页面: $_currentIndex',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, '首页', 0),
            _buildNavItem(Icons.search, '搜索', 1),
            _buildNavItem(Icons.shopping_cart, '购物车', 2),
            _buildNavItem(Icons.person, '我的', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: isSelected ? 28 : 24,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: isSelected ? 12 : 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationExample extends StatefulWidget {
  @override
  _BottomNavigationExampleState createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    _buildPage('首页', Colors.blue),
    _buildPage('搜索', Colors.green),
    _buildPage('收藏', Colors.orange),
    _buildPage('设置', Colors.purple),
  ];

  static Widget _buildPage(String title, Color color) {
    return Container(
      color: color.withOpacity(0.1),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部导航栏示例')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // 固定类型，显示所有标签
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '收藏',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
      ),
    );
  }
}

class FABLocationAnimation extends StatefulWidget {
  @override
  _FABLocationAnimationState createState() => _FABLocationAnimationState();
}

class _FABLocationAnimationState extends State<FABLocationAnimation> {
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endFloat;
  bool _isFabVisible = true;

  final Map<String, FloatingActionButtonLocation> _fabLocations = {
    'endFloat': FloatingActionButtonLocation.endFloat,
    'centerFloat': FloatingActionButtonLocation.centerFloat,
    'endDocked': FloatingActionButtonLocation.endDocked,
    'centerDocked': FloatingActionButtonLocation.centerDocked,
    'startFloat': FloatingActionButtonLocation.startFloat,
  };

  void _changeFabLocation(String location) {
    setState(() {
      _fabLocation = _fabLocations[location]!;
    });
  }

  void _toggleFabVisibility() {
    setState(() {
      _isFabVisible = !_isFabVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAB 位置和动画')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLocationSelector(),
            SizedBox(height: 20),
            _buildVisibilityToggle(),
            Spacer(),
            Text('当前 FAB 位置: ${_fabLocation.toString().split('.').last}'),
          ],
        ),
      ),
      floatingActionButton: _isFabVisible
          ? FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(height: 50),
      ),
    );
  }

  Widget _buildLocationSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择 FAB 位置:', style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: _fabLocations.keys.map((location) {
            return ChoiceChip(
              label: Text(location),
              selected: _fabLocation == _fabLocations[location],
              onSelected: (selected) => _changeFabLocation(location),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildVisibilityToggle() {
    return Row(
      children: [
        Text('FAB 可见性:', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 16),
        Switch(
          value: _isFabVisible,
          onChanged: (value) => _toggleFabVisibility(),
        ),
        Text(_isFabVisible ? '显示' : '隐藏'),
      ],
    );
  }
}
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