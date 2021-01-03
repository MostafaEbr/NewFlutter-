import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/cubit/cubit.dart';
import 'package:flutterapp/layout/home.dart';
import 'package:flutterapp/modules/buisness/cubit/cubit.dart';
import 'package:flutterapp/modules/counter/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => BusinessCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: HomeScreen(),
      ),
    );
  }
}
