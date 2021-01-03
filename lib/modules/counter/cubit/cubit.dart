
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/counter/cubit/status.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialStates());


  static CounterCubit get(context) => BlocProvider.of(context);

  int count = 0 ;

  add(){
    count++;
    emit(CounterIncrementStates());
  }

  minus()
  {
    if(count!=0)
      {
        count--;
        emit(CounterDecrementStates());
      }
  }


}