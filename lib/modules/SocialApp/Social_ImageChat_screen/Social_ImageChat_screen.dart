import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import '../../../models/SocialApp/SocialApp_UserModel.dart';
import '../../../shared/style/icon_broken.dart';

class SocialImageChat_screen extends StatelessWidget {
  final  SocialApp_UserModel ? model;


  SocialImageChat_screen(this.model);
var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconBroken.Arrow___Left_2),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<SocialAppHomeCubit, StatesHome_SocialApp>(
        listener: (context,state){},
        builder: (context,state){
          return Column(
            children: [
              if(state is SocialAppLoadingPickChatImageStates )
                LinearProgressIndicator(),
              SizedBox(
                height: 100,
              ),

              Expanded(
                child: ListView.separated(
                    itemBuilder: (context , index){
                      return buildImageChat(context);
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: 1
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      //height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.5)
                        ),
                        borderRadius: BorderRadius.circular(15),

                      ),
                      constraints: BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: TextFormField(

                          maxLines: null,
                          controller: SocialAppHomeCubit.get(context).textEditingController ,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'type your message her.....',
                              contentPadding: EdgeInsets.all(20.0)
                          ),

                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 1,
                  ),

                  MaterialButton(
                    minWidth: 1,
                    onPressed: ()
                    async {
                        final now = DateTime.now();
                        await SocialAppHomeCubit.get(context).uploadChatImage(
                            UIdRecever: model!.UId!,
                            dateTime: now.toString(),
                            message: SocialAppHomeCubit.get(context).textEditingController.text
                        );
                        SocialAppHomeCubit.get(context).textEditingController.clear();
                        SocialAppHomeCubit.get(context).chatImage=null;
                        Navigator.pop(context);
                    },
                    child: Icon(IconBroken.Send , size: 30 , color: Colors.blue,),

                  ),

                ],
              )
            ],
          );
        },

      ),
    );
  }

  Widget buildImageChat(context)
  {
    return Container(
      height: 390,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(SocialAppHomeCubit.get(context).chatImage!),
          )
      ),

    );
  }
}
