import 'package:flutter/material.dart';
import '../color_theme.dart';


/// FileName: sign_up_page
/// @Author: Alex.凌
/// @Date: 2023/4/21 


/// 注册界面
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  /// 邮箱账号控制器
  final TextEditingController _controllerEmail = TextEditingController();

  /// 密码输入控制器
  final TextEditingController _controllerPassword = TextEditingController();

  /// 设置昵称控制器
  final TextEditingController _controllerFullname = TextEditingController();

  /// 是否隐藏密码
  bool isShowPassword = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMainBody(),
    );
  }


  ///
  Widget getMainBody() {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 返回按钮
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(Icons.arrow_back_ios),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    width: 30,
                    height: 5,
                    decoration: const BoxDecoration(color: primary),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    cursorColor: primary,
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      hintText: "账号",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: !isShowPassword,
                    cursorColor: primary,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                        hintText: "密码",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primary)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primary)),
                        suffixIcon: TextButton(
                            onPressed: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: Icon(
                              isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primary,
                            ))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    cursorColor: primary,
                    controller: _controllerFullname,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      hintText: "昵称",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) {
                                  return primary;
                                })
                            ),
                            onPressed: () {
                              signUP();
                            },
                            child: const Text(
                              "完成",
                              style: TextStyle(color: white),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }


  /// 确认注册信息
  void signUP() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String fullname = _controllerFullname.text;
    print("$email, $password, $fullname");
  }
}
