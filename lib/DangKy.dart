import 'package:flutter/material.dart';

class DangKy extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DangKy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang đăng ký"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Chào mừng bạn đến trang đăng ký!"),
      ),
    );
  }
}
