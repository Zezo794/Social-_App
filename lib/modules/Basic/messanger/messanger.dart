import 'package:flutter/material.dart';
class Messanger  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/91/d0/c9/91d0c92333ccb56395febdc1e3a2dc9b.jpg"),
              radius: 25,
            ),
            SizedBox(
              width: 15,
            ) ,
            Text("Chats " , style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold,),) ,


          ],
        ),
        actions: [

          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: () {},
                icon: Icon(Icons.camera_alt) ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){},
                icon: Icon(Icons.edit)),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15,
                      ),
                      Text("search" , style:
                      TextStyle(fontSize: 20, color: Colors.black),)
                    ],
                  ),
                ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return storyitem();
                    } ,
                    separatorBuilder: (context , index){
                      return SizedBox(
                        width: 20,
                      );
                    }  ,
                    itemCount: 10
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return chatitem();
                  },
                  separatorBuilder: (context,index)
                  {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: 15
              )
            ],
          ),
        ),
      ),
    );
  }
   Widget chatitem()
   {
     return Row(
       children: [
         Stack(
           alignment: AlignmentDirectional.bottomEnd,
           children: [
             CircleAvatar(
               backgroundImage:NetworkImage("https://i.pinimg.com/originals/91/d0/c9/91d0c92333ccb56395febdc1e3a2dc9b.jpg"),
               radius: 25 ,
             ),
             CircleAvatar(
               backgroundColor: Colors.green,
               radius: 7,
             )
           ],
         ),
         SizedBox(
           width: 20,
         ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Shahd mohamed ibrahem Shahd mohamed ibrahem" , style:
               TextStyle(fontSize: 20), maxLines: 1, overflow: TextOverflow.ellipsis,) ,

               Row(
                 children: [
                   Expanded(
                     child: Text("hello iam zezo and iam 20 years old , how are you" , style:
                     TextStyle(fontSize: 20), maxLines: 2, overflow: TextOverflow.ellipsis,),
                   ) ,
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 10,
                     ),
                     child: Container(
                       width: 10,
                       height: 10,
                       decoration: BoxDecoration(
                           color: Colors.blue,
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Text("2:00 pm" , style: TextStyle(fontSize: 20),),
                 ],
               ),
             ],
           ),
         )
       ],
     );
   }

   Widget storyitem()
   {
     return Row(
       children: [
         Container(
           width: 60,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Stack(
                 alignment: AlignmentDirectional.bottomEnd,
                 children: [
                   CircleAvatar(
                     backgroundImage:NetworkImage("https://i.pinimg.com/originals/91/d0/c9/91d0c92333ccb56395febdc1e3a2dc9b.jpg"),
                     radius: 25 ,
                   ),
                   CircleAvatar(
                     backgroundColor: Colors.green,
                     radius: 7,
                   )
                 ],
               ),
               SizedBox(
                 height: 15,
               ),
               Text("Shahd mohamed ibrahem", style:
               TextStyle(fontSize: 20), maxLines: 2, overflow: TextOverflow.ellipsis,),
             ],
           ),
         ),


       ],
     );
   }
}
