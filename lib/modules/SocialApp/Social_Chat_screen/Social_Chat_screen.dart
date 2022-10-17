
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_app1/models/SocialApp/SocialApp_UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/componanets.dart';
import '../Social_DetailsChat_screen/Social_DetailsChat_screen.dart';

class SocialChat_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppHomeCubit,StatesHome_SocialApp>(
      listener: (context,state){},
        builder: (context,state){

          if(SocialAppHomeCubit.get(context).allUser.length>0)

            return ListView.separated(
                itemBuilder: (context, index){
                  return buildChatItem(SocialAppHomeCubit.get(context).allUser[index], context);
                },
                separatorBuilder: (context,index){
                  return Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  );
                },
                itemCount: SocialAppHomeCubit.get(context).allUser.length
            );

            else
            return Center(child: CircularProgressIndicator());


        },

    );
  }



  Widget buildChatItem(SocialApp_UserModel model , context)
  {
    return InkWell(
      onTap: (){
        Navaigateto(context,SocialDetailsChat_screen(model));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('${model.profilImage}'),
              radius: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                Text('${model.name}' , style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
