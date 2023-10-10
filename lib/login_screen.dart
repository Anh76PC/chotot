import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_chotot/DangKy.dart';
import 'package:login_chotot/ForgotPass.dart';
import 'package:login_chotot/HomePage.dart';

class LoginScreen extends StatefulWidget {
  final bool isDesktop;

  const LoginScreen({Key? key, this.isDesktop = false}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final _tendangnhap = TextEditingController();
    final _matkhau = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 112, 11),
        title: const Text("Đăng nhập"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.isDesktop) SizedBox(height: screenHeight * 0.1),
              Container(
                width: widget.isDesktop
                    ? screenWidth * 0.4
                    : null, // Thay đổi tỉ lệ màn hình
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color.fromARGB(30, 40, 60, 1),
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/logorv.png',
                      height: 200,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextField(
                            controller: _tendangnhap,
                            decoration: const InputDecoration(
                              labelText: "Tên đăng nhập",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 251, 123, 0)),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _matkhau,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 251, 123, 0),
                                ),
                              ),
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: "Quên mật khẩu?",
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Xử lý sự kiện khi ấn vào "Quên mật khẩu?"
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPass(),
                                      ),
                                    );
                                  },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              AwesomeDialog(
                                width: 500,
                                context: context,
                                animType: AnimType.leftSlide,
                                headerAnimationLoop: true,
                                keyboardAware: false,
                                dialogType: DialogType.success,
                                showCloseIcon: false,
                                dismissOnBackKeyPress: false,
                                dismissOnTouchOutside: false,
                                title: 'Đăng nhập thành công',
                                btnOkOnPress: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                TenDangNhap: _tendangnhap.text,
                                              )));
                                },
                                desc:
                                    'Chúc mừng bạn đăng nhập thành công:\n${_tendangnhap.text}',
                                btnOkIcon: Icons.check_circle,
                              ).show();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 251, 123, 0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Chưa có tài khoản? ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Đăng ký tài khoản mới",
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Xử lý sự kiện khi ấn vào "Đăng ký tài khoản mới"
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DangKy()));
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (widget.isDesktop) SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
