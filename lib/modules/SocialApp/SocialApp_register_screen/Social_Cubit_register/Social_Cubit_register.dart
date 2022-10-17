import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/SocialApp/SocialApp_UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Social_States_register.dart';

class SocialCubitRegister extends Cubit<SocialRegisterStates>{
  SocialCubitRegister() : super(IntialRegisterSocialState());
  static SocialCubitRegister get(context)
  {
    return BlocProvider.of(context);
  }



  void userRegister({
    required String  name,
    required String  email,
    required String  password,
    required String  phone,
  })
  {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      createUser(name: name, email: email, phone: phone, UId: value.user!.uid );
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialRegistererorrState(erorr.toString()));
    });



  }
  IconData suffix = Icons.visibility_outlined;
  bool ispasswordShown = true;
  void changePasswordIcon()
  {
    ispasswordShown=!ispasswordShown;
    suffix= ispasswordShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePassword());
  }


SocialApp_UserModel ? model;
  void createUser({
  required String name,
    required String email,
    required String phone,
    required String UId,

})
  {
    SocialApp_UserModel  model = SocialApp_UserModel(
      name: name,
      email: email,
      phone: phone,
      coverImage:'https://img.freepik.com/free-photo/indoor-shot-positive-bearded-male-casual-red-t-shirt-points-with-index-finger-aside_273609-16274.jpg',
      profilImage:'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg',
      bio:'Write your bio...',
      UId: UId,
      isverified:false
    );
    
    FirebaseFirestore.instance.collection('users').doc(UId).set(model.toMap()).then((value) {
      emit(SocialCreateUserSucsessState(model.UId));
    }).catchError((erorr){
     print(erorr.toString());
     emit(SocialCreateUsererorrState(erorr.toString()));
    });
  }
}