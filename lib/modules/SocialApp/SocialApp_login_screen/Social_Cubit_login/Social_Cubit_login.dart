import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Social_States_login.dart';

class SocialCubitLogin extends Cubit<SocialLoginStates>{
  SocialCubitLogin() : super(IntialSocialState());
  static SocialCubitLogin get(context)
  {
    return BlocProvider.of(context);
  }



  void userLogin({
    required String   email,
    required String  password,
  })async
  {
    emit(SocialLoginLoadingState());
     FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialLoginSucsessState(value.user?.uid));
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialLoginErorrState(erorr.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool ispasswordShown = true;
  void changePasswordIcon()
  {
    ispasswordShown=!ispasswordShown;
    suffix= ispasswordShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePassword());
  }
}