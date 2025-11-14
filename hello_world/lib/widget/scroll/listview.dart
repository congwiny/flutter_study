import 'package:flutter/material.dart';

class ListViewExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView 示例')),
      body: DynamicListViewExample(),
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