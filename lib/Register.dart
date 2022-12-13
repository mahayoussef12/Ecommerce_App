import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_projet/AuthentificationController.dart';

class Register extends StatelessWidget {
  Register({super.key});

  @override
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthController controller = Get.put(AuthController());


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child:const Text("Register")),backgroundColor: Colors.purpleAccent,
        ),
        body: Center(child:Column(
          children: [
            Container(height:70),
            Image.asset('images/document.png',height:100),
            Container(height:20),
            TextField(
              decoration: const InputDecoration( hintText: "Name",labelText: "Name",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),prefixIcon: Icon(Icons.account_circle_outlined), focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color:Colors.purple,
                    width: 3,
                  )
              )),
              controller: _nameController,
            ),
            Container(height:20),
            TextField(
              decoration: const InputDecoration( hintText: "Email",labelText: "Email",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                  ,prefixIcon: Icon(Icons.email_outlined), focusedBorder: OutlineInputBorder(
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
                  ,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),prefixIcon: Icon(Icons.lock_outline_rounded),
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
            Container(height:30),
        ElevatedButton(
            onPressed: () async {
             controller.register(_nameController.text.trim(),_emailController.text.trim(),
                      _passwordController.text.trim());
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.purple),
             child: const Text("Sign Up")
        )
          ],

        ),

      ));
    }
  }

