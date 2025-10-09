import 'package:flutter/material.dart';

///Flutter 提供了几个不同的构造函数来加载不同来源的图片：
/// Image.asset - 加载本地资源图片（项目中的图片）
/// Image.network - 加载网络图片
/// Image.file - 加载本地文件图片（存储在设备上的图片）
/// Image.memory - 加载内存中的图片（Uint8List）
///
///

class ImageExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image 组件大全')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image.asset - 本地资源图片
            Text(
              '1. Image.asset - 本地资源图片',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // 基础用法
            Image.asset('assets/images/play.png'),
            SizedBox(height: 20),
            // 完整配置
            Image.asset(
              'assets/images/play.png',
              width: 100, //设置图片的宽高
              height: 100,
              /**
               * fit：设置图片的填充方式，常见的值有：
                  BoxFit.fill：全图显示，可能会拉伸。
                  BoxFit.cover：保持宽高比，填满容器，可能会裁剪。
                  BoxFit.contain：保持宽高比，确保整个图片在容器内，容器可能会有空白。
                  BoxFit.fitWidth：宽度填满，高度按比例调整。
                  BoxFit.fitHeight：高度填满，宽度按比例调整。
                  BoxFit.scaleDown：在容器内完整显示，但不会放大，可能缩小。
               */
              fit: BoxFit.cover,
              alignment: Alignment.center, //设置图片在容器内的对齐方式
              repeat: ImageRepeat.noRepeat, //当图片小于容器时，是否重复平铺
            ),
          ],
        ),
      ),
    );
  }
}
