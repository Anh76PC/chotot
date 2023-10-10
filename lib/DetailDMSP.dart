import 'package:flutter/material.dart';
import 'package:login_chotot/HomePage.dart';

class DetailDMSP extends StatefulWidget {
  @override
  State<DetailDMSP> createState() => _DetailDMSPState();
}

class _DetailDMSPState extends State<DetailDMSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Chi tiết danh mục sản phẩm'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: const Center(
        child: Text('Nội dung chi tiết danh mục sản phẩm ở đây.'),
      ),
    );
  }
}
