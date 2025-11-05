/// Positioned 是一个定位组件，只能作为 Stack 的直接子组件使用。
/// 它通过设置 top、bottom、left、right 等属性来精确控制子组件在 Stack 中的位置。
/// Positioned 必须是 Stack 的直接子节点，否则会抛出异常。
///
import 'package:flutter/material.dart';

class PositionedExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Positoned示例')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '1. Positioned 基础示例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PositionedBasicExample(),
            const Divider(height: 32),
            const Text(
              '2. Positioned 各种组合',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PositionedCombinationsExample(),
            const Divider(height: 32),
            const Text(
              '3. 头像徽章设计',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            AvatarBadgeExample(),
            const Divider(height: 32),
            const Text(
              '4. 卡片叠加效果',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CardStackExample()
          ],
        ),
      ),
    );
  }
}

class CardStackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.blue[100],
      child: Stack(
        children: [
          // 第三张卡片
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: _buildCard('卡片 3', Colors.grey[400]!, 0),
          ),

          // 第二张卡片
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: _buildCard('卡片 2', Colors.grey[300]!, 4),
          ),

          // 第一张卡片（最顶层）
          _buildCard('卡片 1', Colors.white, 8),
        ],
      ),
    );
  }

  Widget _buildCard(String title, Color color, double elevation) {
    return Card(
      elevation: elevation,
      color: color,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('这是卡片的内容区域，可以放置各种组件和内容。'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('取消'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('确认'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FabWithBottomNavExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAB + 底部导航')),
      body: Stack(
        children: [
          // 主内容
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text('列表项 $index'),
              subtitle: Text('这是列表项的详细内容'),
            ),
          ),

          // 底部导航
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
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
                  _buildNavItem(Icons.home, '首页', true),
                  _buildNavItem(Icons.search, '搜索', false),
                  SizedBox(width: 40), // 为 FAB 留出空间
                  _buildNavItem(Icons.notifications, '通知', false),
                  _buildNavItem(Icons.person, '我的', false),
                ],
              ),
            ),
          ),

          // 浮动操作按钮
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 30,
            bottom: 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String text, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Colors.blue : Colors.grey, size: 24),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class AvatarBadgeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        _buildAvatarWithBadge(
          'assets/images/avatar1.jpg',
          Colors.green,
          '在线',
        ),
        SizedBox(height: 30),
        _buildAvatarWithBadge(
          'assets/images/avatar2.webp',
          Colors.red,
          '3',
        ),
        SizedBox(height: 30),
        _buildAvatarWithBadge(
          'assets/images/avatar3.png',
          Colors.orange,
          'VIP',
        ),
      ],
    );
  }

  Widget _buildAvatarWithBadge(String imageUrl, Color badgeColor, String badgeText) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 头像
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 徽章
        Positioned(
          right: -5,
          bottom: -5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class PositionedCombinationsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPositionedExample(
          '1. 四边定位 (类似 padding)',
          Stack(
            children: [
              Container(color: Colors.grey[300]),
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
                child: Container(color: Colors.blue),
              ),
            ],
          ),
        ),

        _buildPositionedExample(
          '2. 左右定位 + 高度',
          Stack(
            children: [
              Container(color: Colors.grey[300]),
              Positioned(
                left: 30,
                right: 30,
                top: 40,
                height: 60,
                child: Container(color: Colors.green),
              ),
            ],
          ),
        ),

        _buildPositionedExample(
          '3. 上下定位 + 宽度',
          Stack(
            children: [
              Container(color: Colors.grey[300]),
              Positioned(
                top: 50,
                bottom: 50,
                left: 40,
                width: 80,
                child: Container(color: Colors.red),
              ),
            ],
          ),
        ),

        _buildPositionedExample(
          '4. 单边定位 + 尺寸',
          Stack(
            children: [
              Container(color: Colors.grey[300]),
              Positioned(
                bottom: 20,
                right: 20,
                width: 100,
                height: 50,
                child: Container(color: Colors.orange),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPositionedExample(String title, Stack stack) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14)),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 150,
            child: stack,
          ),
        ],
      ),
    );
  }
}

class PositionedBasicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey[200],
      child: Stack(
        children: [
          // 完全填充 Stack
          Container(color: Colors.blue[100]),

          // 使用 Positioned 精确定位
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red,
              child: Center(child: Text('top:20\nleft:20')),
            ),
          ),

          Positioned(
            top: 50,
            right: 50,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.green,
              child: Center(child: Text('top:50\nright:50')),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 100,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.orange,
              child: Center(child: Text('bottom:30\nleft:100')),
            ),
          ),

          Positioned(
            bottom: 40,
            right: 40,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.purple,
              child: Center(child: Text('bottom:40\nright:40')),
            ),
          ),
        ],
      ),
    );
  }
}
