import 'package:flutter/material.dart';

class ListViewExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView 示例')),
      body: CustomListViewExample(),
    );
  }
}

class CustomListViewExample extends StatelessWidget {
  final List<Color> colors = [
    Colors.red, Colors.blue, Colors.green, Colors.orange,
    Colors.purple, Colors.teal, Colors.amber, Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      //使用 SliverChildDelegate 实现高度自定义。
      childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            height: 100.0,
            color: colors[index % colors.length],
            child: Center(
              child: Text(
                'Custom Item $index',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        childCount: 50,
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
      ),
    );
  }
}

// ListView.separated - 带分隔符的列表
class SeparatedListViewExample extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Section $index');

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey[300],
          thickness: 1.0,
          height: 1.0,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            items[index],
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

class StaticListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
          subtitle: Text('View map location'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
          subtitle: Text('Browse photos'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
          subtitle: Text('Make a call'),
        ),
        // 可以继续添加更多静态子项
      ],
    );
  }
}

//适用于大量或无限滚动的子项。
class DynamicListViewExample extends StatelessWidget {
  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('${index + 1}'),
            ),
            title: Text(items[index]),
            subtitle: Text('This is item number $index'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Tapped on ${items[index]}');
            },
          ),
        );
      },
    );
  }
}