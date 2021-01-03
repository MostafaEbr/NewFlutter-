import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/buisness/cubit/status.dart';

class BusinessCubit extends Cubit<Business_Status> {
  BusinessCubit() : super(BusinessInitialStatus());

  BusinessCubit get(context) => BlocProvider.of(context);

  List articles = [];
  List sports = [];

  void getBusinessApi() async
  {
    emit(BusinessInitialStatus());
    Dio dio = Dio();
    dio.options.baseUrl = "https://newsapi.org/";

    var article = await dio.get("v2/top-headlines", queryParameters: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'ab4d2da7d6f54d62a4d2c22ccedefcb7'
    }).then((value) {
      articles = value.data["articles"] as List;
      emit(BusinessSuccessStatus());
    }).catchError((e) {
      emit(BusinessErrorStatus(e.toString()));
    });
  }

  void getSportsApi() async
  {
    emit(BusinessInitialStatus());
    Dio dio = Dio();
    dio.options.baseUrl = "https://newsapi.org/";

    await dio.get("v2/top-headlines", queryParameters: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'ab4d2da7d6f54d62a4d2c22ccedefcb7'
    }).then((value) {
      sports = value.data["articles"] as List;
      emit(BusinessSuccessStatus());
    }).catchError((e) {
      emit(BusinessErrorStatus(e.toString()));
    });
  }
}
