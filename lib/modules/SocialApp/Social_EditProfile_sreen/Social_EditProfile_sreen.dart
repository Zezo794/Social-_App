
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
import 'package:flutter_app1/shared/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class SocialEditProfile_sreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    var nameEditingController = TextEditingController();
    var bioEditingController = TextEditingController();
    var phoneEditingController = TextEditingController();
    return BlocConsumer<SocialAppHomeCubit, StatesHome_SocialApp>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialAppHomeCubit
            .get(context)
            .user;
        var profileImage = SocialAppHomeCubit
            .get(context)
            .profileImage;
        var coverImage = SocialAppHomeCubit
            .get(context)
            .coverImage;
        var cubit = SocialAppHomeCubit.get(context);
        nameEditingController.text=model!.name!;
        bioEditingController.text=model.bio!;
        phoneEditingController.text=model.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(IconBroken.Arrow___Left_2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Edit Profile'),
            titleSpacing: 5,
            actions: [
              Container(
                width: 100,

                child: MaterialButton(onPressed: (){
                   cubit.updateUserData(name: nameEditingController.text, bio: bioEditingController.text, phone: phoneEditingController.text);
                },
                  child: Text("Update", style:
                  TextStyle(fontSize: 15 , color: Colors.blue ,),  ),

                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is SocialAppLoadingUpdateUserStates)
                    LinearProgressIndicator(),
                  Container(
                    height: 240,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(

                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: getPhotoCover(coverImage,context),
                                    )
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                    onPressed: () {
                                         cubit.getCoverImage();
                                    },
                                    icon: Icon(IconBroken.Camera, size: 14,)
                                ),
                              )
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 65,
                              backgroundColor: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                              child: CircleAvatar(
                                backgroundImage: getPhotoProfile(profileImage, context),
                                radius: 60,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: IconButton(
                                  onPressed: () {
                                      cubit.getProfileImage();
                                  },
                                  icon: Icon(IconBroken.Camera, size: 14,)
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if(profileImage!=null || coverImage!=null)
                  Row(
                    children: [
                      if(profileImage!=null )
                      Expanded(
                        child: Column(
                          children: [
                            defaultbutton(text: 'upload Profile Image', function: (){
                               cubit.uploadProfileImage(name: nameEditingController.text, bio: bioEditingController.text, phone: phoneEditingController.text,);
                            }),
                            SizedBox(
                              height: 5,
                            ),
                            if(state is SocialAppLoadingUpdateUserStates)
                              LinearProgressIndicator()
                          ],
                        ),
                      ),
                       SizedBox(
                         width: 5,
                       ),
                      if(coverImage!=null)
                      Expanded(
                        child: Column(
                          children: [
                            defaultbutton(text: 'upload Cover Image', function: (){
                                cubit.uploadCoverImage(name: nameEditingController.text, bio: bioEditingController.text, phone: phoneEditingController.text);
                            }),
                            SizedBox(
                              height: 5,
                            ),
                            if(state is SocialAppLoadingUpdateUserStates)
                            LinearProgressIndicator()
                          ],
                        ),
                      )
                    ],
                  ),
                  if(profileImage!=null || coverImage!=null)
                  SizedBox(
                    height: 15,
                  ),
                  defaultTextForm(
                      textEditingController: nameEditingController,
                      type: TextInputType.name,
                      onsubmit: (value) {

                      },
                      text: 'Name',
                      prefix: IconBroken.User,
                      validate: (value) {
                        if (value!.isEmpty)
                          return 'Name Must not be empty';
                        return null;
                      }
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                      textEditingController: bioEditingController,
                      type: TextInputType.text,
                      onsubmit: (value) {

                      },
                      text: 'bio',
                      prefix: IconBroken.Info_Circle,
                      validate: (value) {
                        if (value!.isEmpty)
                          return 'bio Must not be empty';
                        return null;
                      }
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                      textEditingController: phoneEditingController,
                      type: TextInputType.number,
                      onsubmit: (value) {

                      },
                      text: 'Phone',
                      prefix: IconBroken.Call,
                      validate: (value) {
                        if (value!.isEmpty)
                          return 'Name Must not be empty';
                        return null;
                      }
                  ),
                ],
              ),
            ),
          ),

        );
      },

    );
  }


  ImageProvider getPhotoCover(coverImage, context)
  {
    if(coverImage!=null)
      return FileImage(coverImage);
    else
      return NetworkImage('${SocialAppHomeCubit.get(context).user?.coverImage}');
  }


  ImageProvider getPhotoProfile(profileImage, context)
  {
    if(profileImage!=null)
      return FileImage(profileImage);
    else
      return NetworkImage('${SocialAppHomeCubit.get(context).user?.profilImage}');
  }
}
