
import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_app1/models/SocialApp/SocialApp_UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/SocialApp/SocialApp_ChatModel.dart';
import '../../../shared/component/componanets.dart';
import '../../../shared/style/icon_broken.dart';
import '../Social_ImageChat_screen/Social_ImageChat_screen.dart';

class SocialDetailsChat_screen extends StatelessWidget {
 final  SocialApp_UserModel ? model;


SocialDetailsChat_screen(this.model);


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
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('${model?.profilImage}'),
            ),
            SizedBox(
              width: 15,
            ),
            Text('${model?.name}')
          ],
        ),
        titleSpacing: 0,
      ),
      
      body: Builder(

        builder: (BuildContext context) {
          SocialAppHomeCubit.get(context).getMessage(UIdReecever: model!.UId!);
          return BlocConsumer<SocialAppHomeCubit, StatesHome_SocialApp>(
            listener: (context, state) {},
            builder: (context, state) {

                 //if(SocialAppHomeCubit.get(context).messages.length>0)
                   return Form(
                   key: formkey,
                   child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Column(
                   children: [
                   Expanded(
                   child: ListView.separated(

                   physics: BouncingScrollPhysics(),
                   itemBuilder: (context,index){
                   var message = SocialAppHomeCubit.get(context).messages[index];
                   if(message.UIdSender==SocialAppHomeCubit.get(context).user?.UId)
                   return messageSent(context , message);

                   return messageRecive(context , message);
                   },
                   separatorBuilder: (context , index){
                   return SizedBox(
                   height: 15,
                   );
                   },
                   itemCount: SocialAppHomeCubit.get(context).messages.length
                   ),
                   ),
                   //Spacer(),
                   SizedBox(
                   height: 15,
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
              validator: (String ?value){
              if(value!.isEmpty)
              return 'message must not be empty';
              return null;
              },
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
              await SocialAppHomeCubit.get(context).getChatImage();
              Navaigateto(context,SocialImageChat_screen(model));
              },
              child: Icon(IconBroken.Image , size: 30 , color: Colors.blue,),

              ),
              SizedBox(
              width: 1,
              ),

              MaterialButton(
              minWidth: 1,
              onPressed: ()
              {
              if(formkey.currentState!.validate())
              {
              final now = DateTime.now();
              SocialAppHomeCubit.get(context).sendMessage(
              UIdRecever: model!.UId!,
              dateTime: now.toString(),
              message: SocialAppHomeCubit.get(context).textEditingController.text
              );
              SocialAppHomeCubit.get(context).textEditingController.clear();
              }

              },
              child: Icon(IconBroken.Send , size: 30 , color: Colors.blue,),

              ),

              ],
              )
              ],
              ),
              ),
              );

                // else
                //   return Center(child: CircularProgressIndicator());


            },

          );
        },

      ),

    );
  }
  Widget messageRecive(context , SocialApp_ChatModel model)
  {
    final size= MediaQuery.of(context).size;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(model.message!='')
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(4),
                topEnd: Radius.circular(4),
                bottomEnd: Radius.circular(4),
              ),
            ),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width*0.5
                ),
                child: Text(model.message!)),
          ),
          if(model.image!='')
          SizedBox(
            height: 15,
          ),
          if(model.image!='')
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: size.width*0.8
            ),
            child: Container(
              height: 390,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${model.image!}'),
                  )
              ),

            ),
          )
        ],
      ),

    );
  }

Widget messageSent(context , SocialApp_ChatModel model)
{
  final size= MediaQuery.of(context).size;
  return  Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if(model.message!='')
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
          ),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(4),
              topEnd: Radius.circular(4),
              bottomStart: Radius.circular(4),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: size.width*0.5
            ),
              child: Text(model.message!)
          ),
        ),
        if(model.image!='')
        SizedBox(
          height: 15,
        ),
        if(model.image!='')
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: size.width*0.8
          ),
          child: Container(
            height: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${model.image!}'),
                )
            ),

          ),
        )
      ],
    ),
  );
}
}
