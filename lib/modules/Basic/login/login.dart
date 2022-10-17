

import 'package:flutter/material.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
var email = TextEditingController();

var password = TextEditingController();

var formkey = GlobalKey<FormState>();
var ispassword= true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("login" , style:
                    TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold,  ),),
                  SizedBox(
                    height: 15,
                  ) ,
                  defaultTextForm(
                      textEditingController: email,
                      type: TextInputType.emailAddress,
                      onsubmit: (value)
                      {
                        print(value);
                      },
                      onchanged: (value)
                      {
                        print(value);
                      },
                      text: "email",
                      prefix: Icons.email,
                      validate: (String? value)
                      {
                        if(value!.isEmpty)
                          return"email must be entered";
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextForm(
                      textEditingController: password,
                      type: TextInputType.visiblePassword,
                      onsubmit: (value)
                      {
                        print(value);
                      },
                      onchanged: (value){
                        print(value);
                      },
                      text: "Password",
                      prefix: Icons.lock,
                      validate: (String ?value)
                      {
                        if(value!.isEmpty)
                          return"Password must be not embty";
                        return null;
                      },
                      obscureText: ispassword,
                    suffix: Icons.remove_red_eye,
                    suffux:(){
                        setState(() {
                          ispassword=!ispassword;
                        });
                    }
                  ) ,
                  SizedBox(
                    height: 15,
                  ),
                  defaultbutton(text: "login" , function: (){
                    if(formkey.currentState!.validate()) {
                      print(email.text);
                      print(password.text);
                    }
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don/'t have acount"),
                      TextButton(onPressed: (){

                      },
                          child: Text("register now"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
