import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/modules/SocialApp/Social_EditProfile_sreen/Social_EditProfile_sreen.dart';
import 'package:flutter_app1/shared/component/componanets.dart';
import 'package:flutter_app1/shared/network/local/Cash_helper.dart';
import 'package:flutter_app1/shared/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import '../../../shared/component/constans.dart';
import '../Social_Post_sreen/Social_Post_sreen.dart';

class SocialSettings_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppHomeCubit,StatesHome_SocialApp>(
      listener: (context, state){},
      builder: (context, state){
        var model = SocialAppHomeCubit.get(context).user;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 240,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(

                      child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${model?.coverImage}')
                            )
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${model?.profilImage}' , ),
                        radius: 60,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('${model?.name}' , style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(
                height: 5,
              ),
              Text('${model?.bio}' , style:Theme.of(context).textTheme.caption ,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100 ' , style: Theme.of(context).textTheme.bodyText1,),
                            Text('Posts' , style:Theme.of(context).textTheme.caption ,),
                          ],
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('200 ' , style: Theme.of(context).textTheme.bodyText1,),
                            Text('Photos' , style:Theme.of(context).textTheme.caption ,),
                          ],
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('220K ' , style: Theme.of(context).textTheme.bodyText1,),
                            Text('Followers' , style:Theme.of(context).textTheme.caption ,),
                          ],
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('1 ' , style: Theme.of(context).textTheme.bodyText1,),
                            Text('Following' , style:Theme.of(context).textTheme.caption ,),
                          ],
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navaigateto(context,SocialPost_sreen());
                        },
                        child: Text('Add Post'),
                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed:() {
                        Navaigateto(context,SocialEditProfile_sreen());
                      },
                      child: Icon(IconBroken.Edit)
                  )
                ],
              ),
              Spacer(),
              defaultbutton(
                  text: 'LogOut',
                  function: (){
                    SignoutSocial(context);
                    UId=CashHelper.getdata(key: 'UId');
                    print('uid is ------------------- ${UId}');
                    SocialAppHomeCubit.get(context).curentindex=0;
                    CashHelper.putbool(key: 'flag1', value: true);
                  }
              )
            ],
          ),
        );
      },

    );
  }
}
