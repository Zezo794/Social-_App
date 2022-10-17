import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../../shared/style/icon_broken.dart';
import '../Social_Feeds_screen/Social_Feeds_screen.dart';

class SocialPost_sreen extends StatelessWidget {
var textEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppHomeCubit,StatesHome_SocialApp>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(IconBroken.Arrow___Left_2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Post screen'),
            actions: [
              Container(
                width: 100,

                child: MaterialButton(onPressed: () async {
                  final now = DateTime.now();
                   if(SocialAppHomeCubit.get(context).postImage==null)
                     {
                       SocialAppHomeCubit.get(context).createNewPost(
                           text: textEditingController.text,
                           dateTime: now.toString()
                       );
                       await SocialAppHomeCubit.get(context).getAllPosts();
                       Navigator.pop(context);
                     }
                   else
                     {
                       SocialAppHomeCubit.get(context).uploadPostImage(
                           text:textEditingController.text,
                           dateTime: now.toString()
                       );
                       await SocialAppHomeCubit.get(context).getAllPosts();
                       SocialAppHomeCubit.get(context).postImage=null;
                       Navigator.pop(context);
                     }
                },
                  child: Text("Post", style:
                  TextStyle(fontSize: 20 , color: Colors.blue ,),  ),

                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if(state is SocialAppLoadingGetPostsStates )
                  LinearProgressIndicator(),
                //SocialAppLoadingPickPostImageStates
                if(state is SocialAppLoadingGetPostsStates )
                  SizedBox(
                    height: 5,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('${SocialAppHomeCubit.get(context).user?.profilImage}' , ),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('${SocialAppHomeCubit.get(context).user?.name}' , style: Theme.of(context).textTheme.bodyText1,),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: 10,
                    controller: textEditingController ,
                    decoration: InputDecoration(
                        hintText: 'Write is your mind ...',
                        border: InputBorder.none
                    ),
                  ),
                ),
                if(SocialAppHomeCubit.get(context).postImage!=null)
                Container(
                  height: 240,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(SocialAppHomeCubit.get(context).postImage!),
                            )
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                        child: IconButton(
                            onPressed: () {
                              SocialAppHomeCubit.get(context).removePostImage();
                            },
                            icon: Icon(Icons.close, size: 14, color: Colors.white,)
                        ),
                      )
                    ],
                  ),
                ),
                if(SocialAppHomeCubit.get(context).postImage!=null)
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            SocialAppHomeCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(
                                width: 5,
                              ),
                              Text('add photo')
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){

                          },
                          child: Text('#add tags')
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
