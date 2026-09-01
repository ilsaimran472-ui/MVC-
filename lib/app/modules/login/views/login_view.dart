import 'package:flutter/material.dart';
import 'package:mvc/app/widgets/custome_button.dart';
import 'package:mvc/app/widgets/custome_textfeild.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 200, 212),
      body: Padding(padding: const EdgeInsets.only(left: 60.0, right: 60.0),
      child: Center(
        child: Column(
          children:[
          SizedBox(height: 40),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/images/logo.jpg"),
          ),
          SizedBox(height: 20),
          Text("WELCOME BACK", 
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: TextEditingController(),
            label: "Email",
           ),
          SizedBox(height: 20),
          CustomTextField(
            controller: TextEditingController(),
            label: "Password"),
          SizedBox(height: 20),
          CustomButton(label: "Login" , onPressed:(){

          }),
          ],
        ),
      ),
      ),
    );
  }
}