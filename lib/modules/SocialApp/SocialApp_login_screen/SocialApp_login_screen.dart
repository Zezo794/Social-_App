
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/shared/network/local/Cash_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import '../../../layout/Social_app/Social_app_Layout_screen.dart';
import '../../../layout/Social_app/rebuildApp.dart';
import '../../../shared/component/componanets.dart';
import '../../../shared/component/constans.dart';
import '../SocialApp_register_screen/SocialApp_reigster_screen.dart';
import 'Social_Cubit_login/Social_Cubit_login.dart';
import 'Social_Cubit_login/Social_States_login.dart';

class SocialAppLogin extends StatelessWidget {

  var emailTextEditingController= TextEditingController();
  var passwordTextEditingController= TextEditingController();
  var formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)
      {
        return  SocialCubitLogin();
      },
      child: BlocConsumer<SocialCubitLogin,SocialLoginStates>(
        listener: (context,state)   {
          if(state is SocialLoginErorrState)
            {
              showToast(message: state.erorr, toast: ToastStates.Erorr);
            }
          if(state is SocialLoginSucsessState)
            {
              UId=state.UId;
               CashHelper.savedata(key: 'UId', value: state.UId).then((value)  {
                 print('Uid become  ${state.UId}');
                 bool flag1 =CashHelper.getdata(key: 'flag1');
                 if(flag1)
                   RestartWidget.restartApp(context);
                 Navaigatetofinsh(context,SocialAppHome());
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
                        Text('Login' , style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black),),
                        SizedBox(
                          height: 15,
                        ),
                        Text('login to Chat with your frinds' , style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextForm(
                            textEditingController: emailTextEditingController,
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
                            textEditingController: passwordTextEditingController,
                            type: TextInputType.visiblePassword,
                            onsubmit: (value){
                              if(formkey.currentState!.validate())
                              {
                                SocialCubitLogin.get(context).userLogin(email: emailTextEditingController.text, password: passwordTextEditingController.text);
                              }
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
                            obscureText: SocialCubitLogin.get(context).ispasswordShown,
                            suffux: ()
                            {
                              SocialCubitLogin.get(context).changePasswordIcon();
                            },
                            suffix: SocialCubitLogin.get(context).suffix


                        ),
                        SizedBox(
                          height: 15,
                        ),

                             if(state is ! SocialLoginLoadingState)

                               defaultbutton(
                                  text: 'Login',
                                  function: ()
                                  {
                                    if(formkey.currentState!.validate())
                                    {
                                      SocialCubitLogin.get(context).userLogin(email: emailTextEditingController.text, password: passwordTextEditingController.text);

                                    }
                                  }
                              )
                            else
                             Center(child: CircularProgressIndicator()),


                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text('Don\'t have an acount'),
                            TextButton(
                                onPressed: (){

                                  Navaigateto(context,SocialApp_Register());
                                },
                                child: Text('Register Now')
                            )
                          ],
                        )
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
