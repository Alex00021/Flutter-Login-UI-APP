import 'package:flutter/material.dart';
import '../color_theme.dart';


/// FileName: forgot_password_page
/// @Author: Alex.凌
/// @Date: 2023/4/21 


/// 重置密码界面
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  /// 邮箱账号控制器
  final TextEditingController _controllerEmail = TextEditingController();



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
                    height: 30,
                  ),
                  const Text(
                      "FORGOT \nPASSWORD",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Container(
                    width: 30,
                    height: 5,
                    decoration: const BoxDecoration(color: primary),
                  ),
                  const SizedBox(
                    height: 30,
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
                              forgotPassword();
                            },
                            child: const Text(
                              "完成",
                              style: TextStyle(color: white),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }


  /// 确认输入账号
  void forgotPassword() {
    String emailField = _controllerEmail.text;
    if (emailField.isNotEmpty) {
      alertSample(emailField);
    }
  }


  /// 发送验证码弹窗
  Future<void> alertSample(email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("FORGOT PASSWORD"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("发送验证码至 $email"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("确认"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
