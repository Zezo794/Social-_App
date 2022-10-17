
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/CubitHome_SocialApp.dart';
import 'package:flutter_app1/layout/Social_app/CubitHome_SocialApp/StatesHome_SocialApp.dart';
import 'package:flutter_app1/shared/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/SocialApp/SocialApp_PostModel.dart';

class SocialFeeds_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppHomeCubit,StatesHome_SocialApp>(
      listener: (context,state){},
      builder: (context,state){

           if(SocialAppHomeCubit.get(context).user!=null&&SocialAppHomeCubit.get(context).post.length>0)

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    margin: EdgeInsetsDirectional.all(8),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image(
                          image: NetworkImage('https://img.freepik.com/free-photo/isolated-shot-satisfied-muslim-student-shows-awesome-advert-points-upper-right-corner-wears-white-veil-jean-jacket_273609-27295.jpg' ),
                          height: 200,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('comunicate with your frinds ' , style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      physics:NeverScrollableScrollPhysics() ,
                      shrinkWrap: true,
                      itemBuilder: (context,index)
                      {
                        return buildPostItem(context, SocialAppHomeCubit.get(context).post[index] , index);
                      },
                      separatorBuilder: (context ,index){
                        return Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[300],
                        );
                      },
                      itemCount: SocialAppHomeCubit.get(context).post.length
                  )

                ],
              ),
            );

          else
            return  Center(child: CircularProgressIndicator());


      },

    );
  }

  Widget buildPostItem(context , SocialApp_PostModel model , index)
  {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('${model.profilImage}'),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${model.name}' , style: Theme.of(context).textTheme.bodyText1,),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.check_circle , color: Colors.blue,size: 16,),

                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${model.dateTime}' , style: Theme.of(context).textTheme.caption,)
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: ()
                      {

                      }
                      , icon: Icon(Icons.more_horiz)
                  ),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Text('${model.text}' , style: TextStyle(height: 1.5),),
            SizedBox(
              height: 5,
            ),
            // Container(
            //   width: double.infinity,
            //   child: Wrap(
            //     children: [
            //       Container(
            //         height: 25,
            //         child: MaterialButton(
            //           onPressed: (){
            //
            //           },
            //           minWidth: 1,
            //           padding: EdgeInsets.zero,
            //           child: Text('#Software' , style: TextStyle(color: Colors.blue,),),
            //         ),
            //       ),
            //       Container(
            //         height: 25,
            //         child: MaterialButton(
            //           onPressed: (){
            //
            //           },
            //           minWidth: 1,
            //           padding: EdgeInsets.zero,
            //           child: Text('#Software' , style: TextStyle(color: Colors.blue,),),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 5,
            ),
            if(model.postImage!='')
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage('${model.postImage}'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(IconBroken.Heart, color: Colors.red, size: 16,),
                            SizedBox(
                              width: 5,
                            ),
                            //
                            Text('${SocialAppHomeCubit.get(context).likes[index]}', style: Theme.of(context).textTheme.caption,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Chat, color: Colors.amber.withOpacity(0.6), size: 16,),
                            SizedBox(
                              width: 5,
                            ),
                            Text('0 comments ', style: Theme.of(context).textTheme.caption,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('${SocialAppHomeCubit.get(context).user?.profilImage}' ),
                            radius: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Write a coment ....'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: ()
                          {
                             SocialAppHomeCubit.get(context).getPostLike(SocialAppHomeCubit.get(context).postId[index]);
                          }
                          , icon: Icon(IconBroken.Heart , color: Colors.amber.withOpacity(0.6), ),

                        ),
                        Text('like'),
                      ],
                    ),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
