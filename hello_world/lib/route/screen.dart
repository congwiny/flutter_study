import 'package:flutter/material.dart';

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('首页')),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('前往第二页并传值'),
//           onPressed: () async {
//             // 等待返回结果
//             final result = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder:
//                     (context) => SecondScreen(message: '来自首页的问候', value: 42),
//               ),
//             );

//             // 显示返回的数据
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text('返回结果: $result')));
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   final String message;
//   final int value;

//   SecondScreen({required this.message, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('第二页')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('接收到的消息: $message'),
//             Text('接收到的数值: $value'),
//             ElevatedButton(
//               child: Text('返回并传值'),
//               onPressed: () {
//                 // 返回时传递数据
//                 Navigator.pop(context, '这是返回的数据');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
      // 处理带参数的路由
      onGenerateRoute: (settings) {
        // 处理 '/third' 路由，它需要参数
        if (settings.name == '/third') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ThirdScreen(
                message: args['message'],
                value: args['value'],
              );
            },
          );
        }
        // 可以在这里处理未知路由
        return null;
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: ElevatedButton(
          child: Text('前往第二页并传参'),
          onPressed: () {
            // 使用命名路由传递参数
            Navigator.pushNamed(
              context,
              '/second',
              arguments: {'message': '来自首页的问候', 'value': 42},
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('第二页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('接收到的消息: ${args['message']}'),
            Text('接收到的数值: ${args['value']}'),
            ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String message;
  final int value;

  ThirdScreen({required this.message, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第三页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('接收到的消息: $message'),
            Text('接收到的数值: $value'),
            ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
