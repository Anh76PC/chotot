import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:login_chotot/Chitietsanpham.dart';
import 'package:login_chotot/DetailDMSP.dart';
import 'package:login_chotot/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:web_hover_menu/web_hover_menu.dart';
import 'package:hover_menu/hover_menu.dart';

class HomePage extends StatefulWidget {
  final String? TenDangNhap;
  final Function? refreshCallback; // Add this callback

  const HomePage({Key? key, this.TenDangNhap, this.refreshCallback})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;
  final GlobalKey<HoverMenuState> hoverMenuKey = GlobalKey<HoverMenuState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 5),
                    autoPlayInterval: const Duration(seconds: 7),
                    enlargeCenterPage: true,
                    viewportFraction: 0.95),
                items: imgList
                    .map((item) => ClipRRect(
                            child: Image.asset(
                          item,
                          fit: BoxFit.fitWidth,
                        )))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.79,
                  child: GridView.count(
                    crossAxisCount: 5,
                    // Số cột trong lưới
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    // Khoảng cách ngang giữa các ô
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: buildGridItems(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 6,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(color: Colors.blueGrey),
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Hỗ trợ khách hàng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Trung tâm trợ giúp'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('An toàn mua bán'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Liên hệ hỗ trợ'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Hỗ trợ khách hàng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Giới thiệu'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Quy chế hoạt động'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Chính sách bảo mật'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    return AppBar(
      toolbarHeight: 80,
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
                GestureDetector(
                  key: hoverMenuKey, // Assign the GlobalKey here
                  excludeFromSemantics: true,
                  child: HoverMenu(
                    title: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    items: buildMenuItems(),
                    width: 250,
                  ),
                ),
                const SizedBox(width: 16),
                isMobile
                    ? Container()
                    : Expanded(
                        child: Container(
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
                        ),
                      ),
                const SizedBox(width: 24),
                buildIconButton(Icons.notifications_none_outlined, 'Thông báo'),
                const SizedBox(width: 8),
                buildIconButton(Icons.chat_outlined, 'Trò chuyện'),
                const SizedBox(width: 8),
                buildIconButton(Icons.shopping_bag_outlined, 'Đơn hàng'),
                const SizedBox(width: 8),
                buildIconButton(Icons.list_alt_outlined, 'Quản lý tin'),
                const SizedBox(width: 8),
                // ignore: unnecessary_null_comparison
                {widget.TenDangNhap} != null
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
                      Icon(
                        Icons.post_add_rounded,
                      ),
                      SizedBox(width: 8),
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

  final List<String> imgList = [
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
  ];
  List<String> ListHinh = [
    'https://cdn.chotot.com/Gv3Q2TAVq2_oohH1BUH8XZKRgsoa0SwmLE_fKEvoPpY/preset:view/plain/155cb458d9c0b0250b52fa5b38d61ff3-2737210137260475232.jpg',
    'https://cdn.chotot.com/fKBG99sx-h0gFyJKWE4anS8_3mHthhqcPEYXsApEYLo/preset:view/plain/2ab5515592b47b6580862b33c56235fc-2672708728310297971.jpg',
    'https://cdn.chotot.com/jMX3SVu5ZytvrZmNLfUiZok4dgZyey6LvGs_6938Jrk/preset:view/plain/58b50eefa205425b57a26a71d96db863-2845800193719379762.jpg',
    'https://cdn.chotot.com/bYDVDczi88C-QAxsLoABsKcA3LIz_AIdSyRD-mrYELw/preset:view/plain/e44b3cf07563bbe4f69f35f78c2c8c63-2846243106297171903.jpg',
    'https://cdn.chotot.com/ALJD1r72vxLKsq_Uv0hGP2il1xVVo3MQU6LEagBH-BQ/preset:view/plain/499cba3394940ef0c2f4035799a1a9b1-2845244876604284490.jpg',
    'https://cdn.chotot.com/eKTRfK72Ndl55AkpkZHIaoN6YFf1xBfAtkDL09IsrKk/preset:view/plain/dd7f1028c8bffdec7b6d9ad49b5e948e-2846079178334600835.jpg',
  ];
  List<String> ListTitle = [
    'Bàn gấp gọn thanh lý gấp',
    'Ghế xoay like new',
    'Ghế xoay văn phòng',
    'Laptop Văn phòng giá rẻ',
    'Laptop ThinkPad còn bảo hành',
    'Laptop màn hình gập cho dân designer',
  ];
  List<String> ListGia = [
    '200.000đ',
    '550.000đ',
    '350.000đ',
    '8.000.000đ',
    '4.500.000đ',
    '12.000.000đ',
  ];
  List<Widget> buildGridItems(double screenWidth, double screenHeight) {
    List<Widget> items = [];
    for (int i = 0; i <= 5; i++) {
      items.add(Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15)),
          width: screenWidth * 0.24,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChitietsanPham(
                            LinkHinh: ListHinh[i],
                            Gia: ListGia[i],
                            Ten: ListTitle[i],
                            TenDangNhap: 'Hung',
                          )));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.network(
                  ListHinh[i],
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: ListTitle[i],
                    style: TextStyle(
                      fontSize: screenWidth * 0.009,
                      color: Colors.black,
                      fontFamily: 'main_font',
                      // Các thuộc tính khác của kiểu chữ
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: ListGia[i],
                    style: TextStyle(
                      fontSize: screenWidth * 0.0085,
                      color: Colors.redAccent,
                      fontFamily: 'main_font',
                      // Các thuộc tính khác của kiểu chữ
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return items;
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

  List<String> itemTitles = ['Xe cộ', 'Đồ điện tử', 'Thời trang', 'Giải trí'];

// Ánh xạ tiêu đề của item với biểu tượng (icons) tương ứng
  final Map<String, IconData> itemIcons = {
    'Xe cộ': Icons.motorcycle,
    'Đồ điện tử': Icons.devices,
    'Thời trang': Icons.directions_walk_sharp,
    'Giải trí': Icons.games,
  };

  List<Widget> buildMenuItems() {
    List<Widget> menuItems = [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 230, 229, 229),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Column(
          children: itemTitles.map((title) {
            return Column(
              children: [
                GestureDetector(
                  // excludeFromSemantics: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/DetailDMSP');
                  },
                  child: ListTile(
                    leading: Icon(itemIcons[title]),
                    title: Text(title),
                    tileColor: const Color.fromARGB(255, 230, 229, 229),
                  ),
                ),
                if (title != itemTitles.last)
                  const Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    height: 0.0,
                  ),
              ],
            );
          }).toList(),
        ),
      ),
    ];

    return menuItems;
  }
}
