import 'package:flutter/material.dart';
import 'package:flutter_app_login_ui/view/sign_up_page.dart';
import '../color_theme.dart';
import 'forgot_password_page.dart';

/// FileName: login_page
/// @Author: Alex.凌
/// @Date: 2023/4/21

/// 密码登录界面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /// 邮箱账号控制器
  final TextEditingController _controllerEmail = TextEditingController();

  /// 密码输入控制器
  final TextEditingController _controllerPassword = TextEditingController();

  /// 是否隐藏密码
  bool isShowPassword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainBody(),
      resizeToAvoidBottomInset: false,
    );
  }


  ///
  Widget mainBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0,),
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            Container(
              width: 30,
              height: 5,
              decoration: const BoxDecoration(
                  color: primary
              ),
            ),
            const SizedBox(height: 40,),
            TextField(
              cursorColor: primary,
              controller: _controllerEmail,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)
                ),
                hintText: "账号",
              ),
            ),
            const SizedBox(height: 30,),
            TextField(
              obscureText: !isShowPassword,
              cursorColor: primary,
              controller: _controllerPassword,
              decoration: InputDecoration(
                  hintText: "密码",
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)
                  ),
                  suffixIcon: TextButton(onPressed: (){
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  }, child: Icon(isShowPassword ? Icons.visibility : Icons.visibility_off,color: primary,))
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
                onTap: (){
                  /// TODO
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ForgotPasswordPage()));
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text("忘记密码?"),)),
            const SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                        //背景颜色
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          //设置按下时的背景颜色
                          if (states.contains(MaterialState.pressed)) {
                            return primary;
                          }
                          //默认不使用背景颜色
                          return primary;
                        }),
                      ),
                      onPressed: (){
                        /// TODO
                      },
                      child: const Text(
                        "登录",
                        style: TextStyle(color: white),)),
                )
              ],
            ),
            const SizedBox(height: 30,),
            InkWell(
                onTap: (){
                  /// TODO
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpPage()));
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("没有账户?"),))
          ],
        ),
      ),
    );
  }
}
