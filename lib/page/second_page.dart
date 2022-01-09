import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'third_page.dart';
import 'first_page.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _stdId = TextEditingController();
  final TextEditingController _stdName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second-Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My second page'),
            AddName(),
            AddStudentID(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Back(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: accept_send(context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton accept_send(BuildContext context) {
    return ElevatedButton(
        child: const Text('ยืนยัน พร้อมส่งค่าข้อมูล'),
        onPressed: () {
          // Navigator.push(context,
          // MaterialPageRoute(
          //     builder: (context) => const thirdpage(
          //           StdId: '622021125',
          //           StdName: 'YOthin Wuttisang',

          //         ));
          if (_formKey.currentState!.validate()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => thirdpage(
                    StdId: _stdId.text,
                    StdName: _stdName.text,
                  ),
                ));
          }
        });
  }

  ElevatedButton Back(BuildContext context) {
    return ElevatedButton(
      child: const Text('กลับไปหน้าเเรก'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget AddName() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _stdName,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณากรอกชื่อนิสิต";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'ชื่อนิสิต',
        ),
      ),
    );
  }

  Widget AddStudentID() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _stdId,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณากรอกรหัสนิสิต";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'รหัสนิสิต',
        ),
      ),
    );
  }
}
