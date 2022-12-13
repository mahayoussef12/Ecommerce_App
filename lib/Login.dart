import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_projet/AuthentificationController.dart';
import 'package:mini_projet/Register.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class Login extends StatelessWidget {
   Login({super.key});

  @override
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:const Text("Login")),backgroundColor: Colors.purpleAccent
      ),
      body: Center(

        child:Column(
        children: [
          Container(height:50),
          Image.asset('images/login.png',height:100),
          Container(height:30),
          TextField(
            decoration: const InputDecoration(
                hintText: "Email",labelText: "Email",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                ,prefixIcon: Icon(Icons.people), focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color:Colors.purple,
                      width: 3,
                    )
                )),
            controller: _emailController,

          ),
          Container(height:20),
          TextField(
            decoration: const InputDecoration( hintText: "Password" ,labelText: "Password"
                ,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),prefixIcon: Icon(Icons.lock),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color:Colors.purple,
                      width: 3,
                    )
                )),
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Get.to(Register());
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple),
                child: const Text("Sign Up"),
              ),
              ElevatedButton(
                onPressed: () async {
                  controller.login(_emailController.text.trim(),
                      _passwordController.text.trim());
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple),
                child: const Text("Login"),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
            onPressed: () {
              controller.signInWithGoogle();
            },
          )
        ],
      ),
      )
    );
  }


 }