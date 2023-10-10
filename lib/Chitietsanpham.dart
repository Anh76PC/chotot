import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChitietsanPham extends StatefulWidget {
  final String LinkHinh;
  final String Gia;
  final String Ten;
  final String? TenDangNhap;
  const ChitietsanPham(
      {super.key,
      required this.LinkHinh,
      required this.Gia,
      required this.Ten,
      this.TenDangNhap});

  @override
  State<ChitietsanPham> createState() => _ChitietsanPhamState();
}

class _ChitietsanPhamState extends State<ChitietsanPham> {
  AppBar buildAppBar(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return AppBar(
      toolbarHeight: 70,
      backgroundColor: const Color.fromARGB(255, 250, 174, 8),
      automaticallyImplyLeading: false,
      title: isMobile
          ? const Text('Giao diện Mobile')
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/logorv.png',
                    width: 100,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 16),
                MouseRegion(
                  onEnter: (_) {},
                  onExit: (_) {},
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                isMobile
                    ? Container()
                    : Expanded(
                        child: buildSearchBar(
                            context), // Thanh tìm kiếm co dãn dựa theo chiều dài màn hình
                      ),
                const SizedBox(width: 24),
                buildIconButton(Icons.notifications_none_outlined, 'Thông báo'),
                const SizedBox(width: 8),
                buildIconButton(Icons.chat_outlined, 'Trò chuyện'),
                const SizedBox(width: 8),
                buildIconButton(Icons.shopping_bag_outlined, 'Đơn hàng'),
                const SizedBox(width: 8),
                buildIconButton(Icons.newspaper_outlined, 'Quản lý tin'),
                const SizedBox(width: 8),
                // ignore: unnecessary_null_comparison
                {widget.TenDangNhap} == null
                    ? buildIconButton(
                        Icons.account_circle_outlined, 'Tài khoản', onTap: () {
                        Navigator.pushNamed(context, '/login');
                      })
                    : buildIconButton(
                        Icons.account_circle_outlined, widget.TenDangNhap!,
                        onTap: () {}),
                const SizedBox(width: 32),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi người dùng nhấn vào nút
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Color.fromARGB(255, 219, 124, 0);
                        }
                        return Colors.orange;
                      },
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 4),
                      Text(
                        'ĐĂNG TIN',
                        style: TextStyle(
                          fontFamily: 'times',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildIconButton(IconData iconData, String tooltip,
      {VoidCallback? onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: Tooltip(
        message: tooltip,
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm trên Rao Vặt',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Row(
              children: [
                Image.network(widget.LinkHinh),
                Column(
                  children: [
                    Text(widget.Ten),
                    Text(widget.Gia),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
