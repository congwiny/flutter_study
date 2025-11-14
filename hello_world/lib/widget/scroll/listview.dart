import 'package:flutter/material.dart';

class ListViewExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView 示例')),
      body: AnimatedListViewExample(),
    );
  }
}

class AnimatedListViewExample extends StatefulWidget {
  @override
  _AnimatedListViewExampleState createState() => _AnimatedListViewExampleState();
}

class _AnimatedListViewExampleState extends State<AnimatedListViewExample> {
  final List<String> _items = List.generate(10, (index) => 'Item $index');

  void _addItem() {
    setState(() {
      _items.add('New Item ${_items.length}');
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(_items[index]),
          background: Container(color: Colors.red),
          secondaryBackground: Container(color: Colors.green),
          onDismissed: (direction) => _removeItem(index),
          child: Card(
            child: ListTile(
              title: Text(_items[index]),
              subtitle: Text('Swipe to dismiss'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeItem(index),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SectionedListViewExample extends StatelessWidget {
  final Map<String, List<String>> sections = {
    'Fruits': ['Apple', 'Banana', 'Orange', 'Grapes'],
    'Vegetables': ['Carrot', 'Broccoli', 'Spinach', 'Tomato'],
    'Dairy': ['Milk', 'Cheese', 'Yogurt', 'Butter'],
    'Meat': ['Chicken', 'Beef', 'Pork', 'Fish'],
  };

  // 生成扁平化索引：每个元素记录是 head 还是 item，并保存对应内容
  List<_Entry> _flatten() {
    final List<_Entry> list = [];
    for (final e in sections.entries) {
      list.add(_Entry.header(e.key));
      for (final item in e.value) {
        list.add(_Entry.item(item));
      }
      // 可选：在每组后面插入分隔占位
      list.add(_Entry.divider());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final flat = _flatten();
    return ListView.builder(
      itemCount: flat.length,
      itemBuilder: (context, index) {
        final e = flat[index];
        if (e.type == _EntryType.header) {
          return Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: Text(e.text!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          );
        } else if (e.type == _EntryType.item) {
          return ListTile(
            key: ValueKey(e.text),
            title: Text(e.text!),
            leading: Icon(Icons.check_circle_outline),
            onTap: () { /* 真实逻辑 */ },
          );
        } else {
          return Divider(height: 1, color: Colors.grey[300]);
        }
      },
    );
  }
}

enum _EntryType { header, item, divider }
class _Entry {
  final _EntryType type;
  final String? text;
  _Entry.header(this.text) : type = _EntryType.header;
  _Entry.item(this.text) : type = _EntryType.item;
  _Entry.divider() : type = _EntryType.divider, text = null;
}


//下拉刷新与上拉加载
class RefreshableListViewExample extends StatefulWidget {
  @override
  _RefreshableListViewExampleState createState() => _RefreshableListViewExampleState();
}

class _RefreshableListViewExampleState extends State<RefreshableListViewExample> {
  final List<String> _items = List.generate(20, (index) => 'Initial Item $index');
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreData();
    }
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _items.clear();
      _items.addAll(List.generate(20, (index) => 'Refreshed Item $index'));
    });
  }

  Future<void> _loadMoreData() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      final startIndex = _items.length;
      _items.addAll(List.generate(10, (index) => 'Loaded Item ${startIndex + index}'));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1, // 为加载指示器预留位置
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : SizedBox.shrink();
          }

          return ListTile(
            title: Text(_items[index]),
            leading: Icon(Icons.star),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ScrollControllerExample extends StatefulWidget {
  @override
  _ScrollControllerExampleState createState() => _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  final ScrollController _controller = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _scrollOffset = _controller.offset;
      });
    });
  }

  void _scrollToTop() {
    _controller.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: Text('Scroll Offset: ${_scrollOffset.toStringAsFixed(2)}'),
        ),
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
                subtitle: Text('Scroll to see controller in action'),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _scrollToTop,
              child: Text('To Top'),
            ),
            ElevatedButton(
              onPressed: _scrollToBottom,
              child: Text('To Bottom'),
            ),
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