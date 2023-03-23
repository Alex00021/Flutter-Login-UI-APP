import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

const primary = Color(0xffc73e1d);
const white = Color(0xffffffff);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
