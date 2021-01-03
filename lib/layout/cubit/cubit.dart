import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/cubit/states.dart';
import 'package:flutterapp/modules/buisness/business_screen.dart';
import 'package:flutterapp/modules/counter/counter_Screen.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  var myWidgets = [
    BusinessScreen("business"),
    BusinessScreen('sports'),

  ];

  var selectedItems = [
    false,
    false
  ];

  var myTitles = [
    "Business",
    "Sports"
  ];


  onchangeIndex(index){
    currentIndex = index ;
    selectedItems[index] = !selectedItems[index];
    emit(HomeIndexStates());
  }


}