import 'package:bloc/bloc.dart';
import 'package:flutter_app1/modules/Basic/counter/cubit/states2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';







class CounterCubit extends Cubit<CounterState>
{
   CounterCubit(): super(Intialsata());
   static CounterCubit get(context)
   {
      return BlocProvider.of(context);
   }
   int counter =1;
   void minus()
   {
      counter-- ;
      emit(CounterMinusState(counter));
   }
   void plus()
   {
      counter++ ;
      emit(CounterPlusState(counter));
   }
}