import 'package:flutter/material.dart';

class Result extends StatelessWidget {
final double ? result1;
final bool ? ismale1 ;
final int ? age1 ;
Result({
  this.result1,
  this.age1,
  this.ismale1
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:() {
           Navigator.pop(context);
        }
          ,icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Result of calc" , style:
          TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Gender :${(ismale1!) ? 'male' : 'female'} " , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
            Text("result : ${result1}" , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
            Text("age : ${age1}" , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
