import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states2.dart';





class Counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) {
        return CounterCubit();
      },
      child: BlocConsumer<CounterCubit, CounterState>(

        listener: (BuildContext context, state) {
          if(state is CounterMinusState) {
            print("CounterMinusState");
            print("CounterMinusState ${state.counter}");
          }
          if(state is CounterPlusState) {
            print("CounterPlusState");
            print("CounterPlusState ${state.counter}");
          }
        },
        builder: (BuildContext context, Object? state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text("Counter" , style:
              TextStyle(fontSize: 20),),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  TextButton(
                      onPressed: (){
                        CounterCubit.get(context).plus();

                      },
                      child: Text("plus", style:
                      TextStyle(fontSize: 30),)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: Text("${CounterCubit.get(context).counter}" , style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),),
                  ) ,
                  TextButton(
                      onPressed: (){

                        CounterCubit.get(context).minus();
                      },
                      child: Text("minus", style:
                      TextStyle(fontSize: 30),)
                  ),
                ],
              ),
            ),
          );
        },

    )
    );
  }
}

