

import 'dart:core';

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/models/SocialApp/SocialApp_ChatModel.dart';
import 'package:flutter_app1/models/SocialApp/SocialApp_PostModel.dart';
import 'package:flutter_app1/modules/SocialApp/Social_Settings_screen/Social_Settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/SocialApp/SocialApp_UserModel.dart';
import '../../../modules/SocialApp/Social_Chat_screen/Social_Chat_screen.dart';
import '../../../modules/SocialApp/Social_Feeds_screen/Social_Feeds_screen.dart';
import '../../../modules/SocialApp/Social_Post_sreen/Social_Post_sreen.dart';
import '../../../modules/SocialApp/Social_Users_screen/Social_Users_screen.dart';
import '../../../shared/component/constans.dart';
import 'StatesHome_SocialApp.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialAppHomeCubit extends Cubit<StatesHome_SocialApp>
{
  SocialAppHomeCubit() : super(SocialInitialStates());
  static SocialAppHomeCubit get(context)
  {
    return BlocProvider.of(context);
  }
  SocialApp_UserModel ? user ;
  void grtUser_Data()
  {
    emit(SocialAppLoadingGetUsreStates());
     FirebaseFirestore.instance.collection('users').doc(UId).get().then((value) {
      print(value.data());
      user=SocialApp_UserModel.fromjson(value.data());
      emit(SocialAppSucsessGetUsreStates());
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialAppErorrGetUsreStates(erorr.toString()));
    });
  }

  int curentindex =0 ;
  List<Widget> screens = [
    SocialFeeds_screen(),
    SocialChat_screen(),
    //SocialUsers_screen(),
    SocialSettings_screen()
  ];

List<String> titels = [
  'Home',
  'Chat',
  //'User',
  'Profile'
];

  void changNavBar(index)
  {
    if(index ==2)
      {
        emit(SocialAppNewPostStates());
      }

    else
      {
        curentindex=index;
        emit(SocialAppChangeNavBarStates());
        if(index==1)
        {
          getAllUser();
        }

      }
  }


   File? profileImage;
   var picker = ImagePicker();
   Future<void> getProfileImage()async
   {
     final pickedFile= await picker.pickImage(
         source: ImageSource.gallery
     );
     if(pickedFile!=null)
       {
         profileImage = File(pickedFile.path);
         emit(SocialAppSucsessPickProfileImageStates());
       }
     else
       {
         print('No Image selected ');
         emit(SocialAppErorrPickProfileImageStates());
       }
   }

  File? coverImage;

  Future<void> getCoverImage()async
  {
    final pickedFile= await picker.pickImage(
        source: ImageSource.gallery
    );
    if(pickedFile!=null)
    {
      coverImage = File(pickedFile.path);
      emit(SocialAppSucsessPickCoverImageStates());
    }
    else
    {
      print('No Image selected ');
      emit(SocialAppErorrPickCoverImageStates());
    }
  }



  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
  })
  {
    emit(SocialAppLoadingUpdateUserStates());
    firebase_storage.FirebaseStorage.instance.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!).then((value) {
          value.ref.getDownloadURL().then((value) {
            //emit(SocialAppSucsessUploadProfileImageStates());
            updateUserData(name: name, bio: bio, phone: phone , profile: value);
          }).catchError((erorr){
            emit(SocialAppErorrUploadProfileImageStates());
            print(erorr.toString());
          });
    }).catchError((erorr){
      emit(SocialAppErorrUploadProfileImageStates());
      print(erorr.toString());
    });
  }


  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
  })
  {
    emit(SocialAppLoadingUpdateUserStates());
    firebase_storage.FirebaseStorage.instance.ref().child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!).then((value){
          value.ref.getDownloadURL().then((value) {

           // emit(SocialAppSucsessUploadCoverImageStates());
            updateUserData(name: name, bio: bio, phone: phone , cover: value);
          }).catchError((erorr){
            emit(SocialAppErorrUploadCoverImageStates());
            print(erorr.toString());
          });
    }).catchError((erorr){
      emit(SocialAppErorrUploadCoverImageStates());
      print(erorr.toString());
    });
  }




  void updateUserData({
    required String name,
    required String bio,
    required String phone,
    String ?cover,
    String ? profile
})
{

  SocialApp_UserModel  model = SocialApp_UserModel(
      name: name,
      email: user!.email,
      phone: phone,
      coverImage:cover??user?.coverImage,
      profilImage:profile??user!.profilImage,
      bio:bio,
      UId: user!.UId,
      isverified:false);
  FirebaseFirestore.instance.collection('users').doc(user!.UId).update(model.toMap()).then((value) {
    grtUser_Data();
  }).catchError((erorr){
    print(erorr.toString());
    emit(SocialAppErorrUpdateUserStates());
  });
}



  File? postImage;

  Future<void> getPostImage()async
  {
    final pickedFile= await picker.pickImage(
        source: ImageSource.gallery
    );
    if(pickedFile!=null)
    {
      postImage = File(pickedFile.path);
      emit(SocialAppSucsessPickPostImageStates());
    }
    else
    {
      print('No Image selected ');
      emit(SocialAppErorrPickPostImageStates());
    }
  }




  void createNewPost({
    required String text,
    required String dateTime,
    String ?postImage,
  })
  {

    SocialApp_PostModel model= SocialApp_PostModel(
      name: user!.name,
      UId: user!.UId,
      profilImage: user!.profilImage,
      postImage: postImage??'',
      text: text,
      dateTime: dateTime
    );
    emit(SocialAppLoadingPickPostImageStates());
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      emit(SocialAppSucsessPickPostImageStates());
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialAppErorrPickPostImageStates());
    });
  }



  void uploadPostImage({
    required String text,
    required String dateTime,
  })
  {
    emit(SocialAppLoadingPickPostImageStates());
    firebase_storage.FirebaseStorage.instance.ref().child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!).then((value){
      value.ref.getDownloadURL().then((value) {

        // emit(SocialAppSucsessUploadCoverImageStates());
        createNewPost(text: text, dateTime: dateTime , postImage: value);
      }).catchError((erorr){
        emit(SocialAppErorrUploadPostImageStates());
        print(erorr.toString());

      });
    }).catchError((erorr){
      emit(SocialAppErorrUploadPostImageStates());
      print(erorr.toString());
    });
  }


  void removePostImage()
  {
    postImage=null;
    emit(SocialAppRemovePostImageStates());
  }


  List<SocialApp_PostModel> post = [];
  List<String>postId = [];
  List<int>likes=[];
  Future<void> getAllPosts()async
  {
    post = [];
    postId = [];
    likes=[];
    emit(SocialAppLoadingGetPostsStates());
    return  await FirebaseFirestore.instance.collection('posts').get().then((value) async {

      for (var element in value.docs) {

        print('lllllllllllll');
         await element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          print('likes count   ${value.docs.length}');
          postId.add(element.id);
          post.add(SocialApp_PostModel.fromjson(element.data()));
          print(element.data());
          print(post.length);

        }).catchError((erorr){
          print(erorr.toString());
        });
      }
      emit(SocialAppSucsessGetPostsStates());
      print('lolo lolol    ${post.length}');
      print(post);
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialAppErorrGetPostsStates(erorr.toString()));
    });
  }






  void getPostLike(String postId){
    FirebaseFirestore.instance.collection('posts').doc(postId).collection('likes')
        .doc(user?.UId).set({
      'like':true
    }).then((value) {
      emit(SocialAppSucsessPostLikeStates());
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialAppErorrPostLikeStates());
    });
  }


List<SocialApp_UserModel> allUser = [];
  void getAllUser()
  {
    emit(SocialAppLoadingGetAllUsreStates());
    if(allUser.length==0)
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
      if(user?.UId!=element.data()['UId'])
        allUser.add(SocialApp_UserModel.fromjson(element.data()));
      }
      emit(SocialAppSucsessGetAllUsreStates());
    }).catchError((erorr){
      print(erorr.toString());
      emit(SocialAppErorrGetAllUsreStates(erorr.toString()));
    });
  }


void sendMessage({
  required String UIdRecever,
  required String dateTime,
  required String message,
  String ?image
})
{
  SocialApp_ChatModel model = SocialApp_ChatModel(
    UIdReciver: UIdRecever,
    UIdSender: user?.UId,
    message: message,
    dateTime: dateTime,
    image: image??''
  );
  FirebaseFirestore.instance.collection('users').doc(user?.UId).collection('chats').doc(UIdRecever)
      .collection('messages').add(model.toMap()).then((value) {
      emit(SocialAppSucsessSendMessageStates());
  }).catchError((erorr){
     print(erorr.toString());
     emit(SocialAppErorrSendMessageStates());
  });



  FirebaseFirestore.instance.collection('users').doc(UIdRecever).collection('chats').doc(user?.UId)
      .collection('messages').add(model.toMap()).then((value) {
    emit(SocialAppSucsessSendMessageStates());
  }).catchError((erorr){
    print(erorr.toString());
    emit(SocialAppErorrSendMessageStates());
  });
}

List<SocialApp_ChatModel> messages = [];
void getMessage({
  required String UIdReecever
})
{

  FirebaseFirestore.instance.collection('users').doc(user?.UId).collection('chats')
      .doc(UIdReecever).collection('messages').orderBy('dateTime')
      .snapshots()
      .listen((event) {
    messages = [];
        event.docs.forEach((element) {
          messages.add(SocialApp_ChatModel.fromjson(element.data()));
        });
        emit(SocialAppSucsessgetMessageStates());
  });
}


  File? chatImage;

  Future<void> getChatImage()async
  {
    final pickedFile= await picker.pickImage(
        source: ImageSource.gallery
    );
    if(pickedFile!=null)
    {
      chatImage = File(pickedFile.path);
      emit(SocialAppSucsessPickChatImageStates());
    }
    else
    {
      print('No Image selected ');
      emit(SocialAppErorrPickChatImageStates());
    }
  }
  var textEditingController= TextEditingController();



  Future<void> uploadChatImage({
    required String UIdRecever,
    required String dateTime,
    required String message ,
  })async
  {
    emit(SocialAppLoadingPickChatImageStates());
    await firebase_storage.FirebaseStorage.instance.ref().child('chatsImage/${Uri.file(chatImage!.path).pathSegments.last}')
        .putFile(chatImage!).then((value){
      value.ref.getDownloadURL().then((value) {

        // emit(SocialAppSucsessUploadCoverImageStates());
        sendMessage(UIdRecever: UIdRecever, dateTime: dateTime, message: message,image:value);
      }).catchError((erorr){
        emit(SocialAppErorrUploadchatImageStates());
        print(erorr.toString());
      });
    }).catchError((erorr){
      emit(SocialAppErorrUploadchatImageStates());
      print(erorr.toString());
    });
  }

}