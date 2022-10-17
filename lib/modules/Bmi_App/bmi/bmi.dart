import 'dart:math';

import 'package:flutter/material.dart';


import '../result/result.dart';


class Bmi extends StatefulWidget {


  @override
  State<Bmi> createState() => _BmiState();
}


class _BmiState extends State<Bmi> {

  bool isman = true;
  double height=100;
  int weight =60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator" ,style:
          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isman=true;
                        });
                      },
                      child: Container(

                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('asets/image/Female.png'),height: 90,width: 90,),
                            Text("Male" ,style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          ],
                        ),
                          decoration: BoxDecoration(
                            color: (isman) ? Colors.blue : Colors.grey ,
                            borderRadius: BorderRadius.circular(20),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isman = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (isman) ? Colors.grey : Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("asets/image/Male.png"), height: 90, width: 90,),

                            Text("Female" ,style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height" ,style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic ,
                      children: [
                        Text("${height.round()}" ,style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                        Text("cm" ,style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Slider(
                      value:height ,
                       max: 200,
                        min: 80,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });

                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight" ,style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          Text("${weight}" ,style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });

                              },
                                heroTag: "weigt-",
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                heroTag: "weigt+",
                                mini: true,
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age" ,style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          Text("${age}" ,style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag: "age-",
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: "age+",
                                mini: true,
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            height: 60,
            child: TextButton(
                  onPressed: (){
                         var result = weight / pow(height, 2);
                         Navigator.push(context,
                           MaterialPageRoute(builder: (context)
                           {
                             return Result(
                               result1: result,
                               age1:age ,
                               ismale1: isman,
                             );
                           })
                         );
                     },
                     child: Text("Calculate" ,style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold , color: Colors.white),),
                              ),
            )

        ],
      ),
    );
  }
}
