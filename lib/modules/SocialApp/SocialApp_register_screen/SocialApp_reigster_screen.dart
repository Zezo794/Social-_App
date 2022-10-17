
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/Social_app_Layout_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../layout/Social_app/rebuildApp.dart';
import '../../../shared/component/componanets.dart';
import '../../../shared/component/constans.dart';
import '../../../shared/network/local/Cash_helper.dart';
import 'Social_Cubit_register/Social_Cubit_register.dart';
import 'Social_Cubit_register/Social_States_register.dart';

class SocialApp_Register extends StatelessWidget {

  var formkey = GlobalKey<FormState>();
  var nameTextEditControler = TextEditingController();
  var emailTextEditControler = TextEditingController();
  var passwordTextEditControler = TextEditingController();
  var phoneTextEditControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)
      {
        return SocialCubitRegister();
      },
      child: BlocConsumer<SocialCubitRegister,SocialRegisterStates>(
        listener: (context,state){
               if(state is SocialRegistererorrState)
              showToast(message: state.erorr, toast: ToastStates.Erorr);
               if(state is SocialCreateUserSucsessState)
                 {
                   UId=state.UId;
                   CashHelper.savedata(key: 'UId', value: state.UId).then((value) {
                     bool flag1 =CashHelper.getdata(key: 'flag1');
                     Navaigatetofinsh(context,SocialAppHome());
                     if(flag1)
                       RestartWidget.restartApp(context);
                   });

                 }

        },
        builder: (context,state){
          return Form(
            key: formkey,
            child: Scaffold(

              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register' , style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black),),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Register Now to Chat with frindes' , style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextForm(
                            textEditingController: nameTextEditControler,
                            type: TextInputType.name,
                            onsubmit: (value){

                            },
                            text: 'User Name',
                            prefix: Icons.person,
                            validate: (String ?value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'User Name must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextForm(
                            textEditingController: emailTextEditControler,
                            type: TextInputType.emailAddress,
                            onsubmit: (value){

                            },
                            text: 'email adress',
                            prefix: Icons.email_outlined,
                            validate: (String ?value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'email must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextForm(
                            textEditingController: passwordTextEditControler,
                            type: TextInputType.visiblePassword,
                            onsubmit: (value){

                            },
                            text: 'Password',
                            prefix: Icons.lock,
                            validate: (String ?value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            obscureText: SocialCubitRegister.get(context).ispasswordShown,
                            suffux: ()
                            {
                              SocialCubitRegister.get(context).changePasswordIcon();
                            },
                            suffix: SocialCubitRegister.get(context).suffix


                        ),
                        SizedBox(
                          height: 15,
                        ),

                        defaultTextForm(
                            textEditingController: phoneTextEditControler,
                            type: TextInputType.phone,
                            onsubmit: (value){

                            },
                            text: 'Phone Number',
                            prefix: Icons.email_outlined,
                            validate: (String ?value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'email must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 30,
                        ),

                             if(state is ! SocialRegisterLoadingState)

                               defaultbutton(
                                  text: 'Register',
                                  function: ()
                                  {
                                    if(formkey.currentState!.validate())
                                    {
                                      SocialCubitRegister.get(context).userRegister(name: nameTextEditControler.text, email: emailTextEditControler.text, password: passwordTextEditControler.text, phone: phoneTextEditControler.text);
                                    }
                                  }
                              )
                            else
                            Center(child: CircularProgressIndicator())


                      ],
                    ),
                  ),
                ),
              ),

            ),
          );
        },

      ),
    );
  }
}