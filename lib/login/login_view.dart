import 'package:flutter/material.dart';
import 'package:focused_pupa_clone/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final dataKey = GlobalKey();
  bool isTap = false;
  bool isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String imageUrl =
      "https://i.pinimg.com/736x/7c/e3/ff/7ce3ffef8231526180a4e86914e67cc9.jpg";
  final String logoUrl =
      "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/cgu977lqrecth2n4t7it";
  @override
  Widget build(BuildContext context) {
    final bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        _logo(),
        Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              excludeHeaderSemantics: true,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: AppBarTheme.of(context)
                  .systemOverlayStyle!
                  .copyWith(
                      statusBarColor: Colors.transparent,
                      systemNavigationBarDividerColor: Colors.transparent),
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _body(isKeyboard),
              ],
            ))
      ],
    );
  }

  AnimatedContainer _body(bool isKeyboard) {
    bool check = isKeyboard;
    return AnimatedContainer(
      height: isKeyboard ? null : MediaQuery.of(context).size.height * 0.75,
      duration: const Duration(milliseconds: 1),
      curve: Curves.decelerate,
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _headLine(),
          _register(),
          _email(),
          _password(),
          _forgotPassword(),
          _loginButton(),
          if (!check) _offStage(),
        ],
      ),
    );
  }

  Text _headLine() {
    return Text(
      "Giriş Yap",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: Colors.black,
      ),
    );
  }

  Row _register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Hesabın yok mu?", style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Kaydol",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Wrap _email() {
    return Wrap(
      children: [
        const Text("E-mail", style: TextStyle(color: Colors.black)),
        _emailTextField(),
      ],
    );
  }

  Wrap _password() {
    return Wrap(
      runSpacing: 10,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Şifre", style: TextStyle(color: Colors.black)),
        ),
        _passwordTextField(),
      ],
    );
  }

  TextField _emailTextField() {
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: emailController,
      onTap: _onTap,
      decoration: const InputDecoration(
        hintText: "E-mail adresini doğru şekilde buraya yazınız!",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: passwordController,
      onTap: _onTap,
      style: const TextStyle(color: Colors.black),
      obscureText: isObscure,
      decoration: InputDecoration(
          hintText: "Lütfen parolanızı giriniz!",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                color: isObscure ? Colors.black38 : Colors.black26,
              ))),
    );
  }

  Container _forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Şifremi Unuttum?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  SizedBox _loginButton() {
    return SizedBox(
      key: dataKey,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            if (emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeView()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Lütfen bilgilerinizi kontrol ediniz!"),
              ));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Giriş Yap",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Column _offStage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Divider(
                color: Colors.grey,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text("veya",
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                color: Colors.white,
                iconSize: 40,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: IconButton(
                onPressed: () {},
                icon: Image.network(
                    "https://pngimg.com/uploads/google/google_PNG19635.png"),
                color: Colors.white,
                iconSize: 40,
              ),
            )
          ],
        )
      ],
    );
  }

  void _onTap() {
    setState(() {
      isTap = true;
    });
  }

  Container _logo() {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Image.network(
        logoUrl,
      ),
    );
  }
}
