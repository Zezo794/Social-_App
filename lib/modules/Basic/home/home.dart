import 'package:flutter/material.dart';
class home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu
        ),
        title: Text("my first app"
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                print("hello");
                }, icon: Icon(
          Icons.notification_add
      ))
          ,
          IconButton(onPressed: (){print("searsh");}, icon: Icon(
              Icons.search
          )),

        ],
        centerTitle: true,
      ) ,
     body: Container(
       width: 200,

       padding: EdgeInsets.symmetric(
         vertical: 10,
       ),
       child: Padding(
         padding: const EdgeInsets.all(50),
         child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),

           ),
           clipBehavior: Clip.antiAliasWithSaveLayer,
           child: Stack(
             alignment: Alignment.bottomCenter,
             children: [
               Image(
                 image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg"),
               height: 250,
                 width: 250,
                 fit: BoxFit.cover,
               ),
               Container(
                 color: Colors.cyan.withOpacity(0.7),
                 width: double.infinity,
                 child: Text("flower" , style:
                   TextStyle(color: Colors.white , fontSize: 30,),textAlign:TextAlign.center ,),
               ),
             ],
           ),
         ),
       ),
     )

    );
  }

}