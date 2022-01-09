import 'package:flutter/material.dart';

class thirdpage extends StatefulWidget {
  const thirdpage({Key? key, this.StdId, this.StdName}) : super(key: key);

  final String? StdId;
  final String? StdName;

  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third-Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('รหัสนิสิต :' + widget.StdId!),
            Text('ชื่อ :' + widget.StdName!),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('กลับไปหน้าที่ 2'))
          ],
        ),
      ),
    );
  }
}
