
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app1/shared/BlocObserver.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
import 'package:flutter_app1/shared/component/constans.dart';
import 'package:flutter_app1/shared/network/local/Cash_helper.dart';
import 'package:flutter_app1/shared/network/remote/dio_helper.dart';
import 'package:flutter_app1/shared/style/Thems.dart';
import 'package:flutter_app1/shared/todocubit/cubit.dart';
import 'package:flutter_app1/shared/todocubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'layout/Social_app/Social_app_Layout_screen.dart';

import 'layout/Social_app/rebuildApp.dart';
import 'modules/SocialApp/SocialApp_login_screen/SocialApp_login_screen.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
print(message.data.toString());
showToast(message: 'on background message', toast: ToastStates.Sucsess);
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  await CashHelper.init();
  bool? isshared=   CashHelper.getbool(key: 'isDark');
  bool? onboarding=   CashHelper.getbool(key: 'onboarding');
   token=   CashHelper.getdata(key: 'token');
  UId=   CashHelper.getdata(key: 'UId');
  Widget ? widget;
  var token2= await FirebaseMessaging.instance.getToken();
  print('token2${token2}');
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
    showToast(message: 'on message', toast: ToastStates.Sucsess);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    showToast(message: 'on message opend app', toast: ToastStates.Sucsess);
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);





  if(UId!= null)
    {
      widget = SocialAppHome() ;
      CashHelper.putbool(key: 'flag1', value: true);
    }
  else
    {
      widget = SocialAppLogin();
      CashHelper.putbool(key: 'flag1', value: false);
    }
  runApp( RestartWidget(
      child: myApp(isshared , widget)
  ));
  print(isshared);
}

class myApp extends StatelessWidget
{
  final bool ? isshared;
  final Widget ? widget;
  myApp(this.isshared,this.widget);


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context)
    {
      return AppCubit()..changedarkmode(
          fromshared: isshared
      );
    }
        ),


        BlocProvider(
            create: (context)
            {
              return SocialAppHomeCubit()..grtUser_Data()..getAllPosts();
            }
        ),
      ],
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp( home:widget,
            theme: ligtthem,
            darkTheme: darkthem,
            themeMode: ThemeMode.light, // AppCubit.get(context).isdark ? ThemeMode.dark :
          );
        },

      ),
    );
  }

}