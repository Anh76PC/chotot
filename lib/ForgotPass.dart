import 'package:flutter/material.dart';

class ForgotPass extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ForgotPass({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang quên mật khẩu"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Chào mừng bạn đến trang quên mật khẩu!"),
      ),
    );
  }
}
