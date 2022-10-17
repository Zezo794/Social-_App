
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
import 'package:flutter_app1/shared/network/local/Cash_helper.dart';
import 'package:flutter_app1/shared/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/SocialApp/SocialApp_login_screen/SocialApp_login_screen.dart';
import '../../modules/SocialApp/Social_Post_sreen/Social_Post_sreen.dart';
import '../../shared/component/constans.dart';
import 'CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'CubitHome_SocialApp/StatesHome_SocialApp.dart';

class SocialAppHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppHomeCubit,StatesHome_SocialApp>(
      listener: (context , state){
        if(state is SocialAppNewPostStates)
          Navaigateto(context,SocialPost_sreen());
      },
      builder: (context , state){
        var cubit = SocialAppHomeCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: cubit.curentindex <2 ?Text(cubit.titels[cubit.curentindex]):Text(cubit.titels[cubit.curentindex-1]),
              actions: [
                IconButton(
                    onPressed: () {

                    },
                    icon:Icon(IconBroken.Notification),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon:Icon(IconBroken.Search),
                ),
              ],
            ),
            body: cubit.curentindex <2 ?cubit.screens[cubit.curentindex]:cubit.screens[cubit.curentindex-1] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curentindex,
              onTap: (index){
               cubit.changNavBar(index);
               print(index);
              },
              items: [
              BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Upload), label: 'Posts'),
                //BottomNavigationBarItem(icon: Icon(IconBroken.Location), label: 'User'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Profile), label: 'Profile'),
            ],
            ),
        ) ;
      },

    );
  }
}
