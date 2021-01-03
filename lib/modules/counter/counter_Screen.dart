import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/counter/cubit/cubit.dart';
import 'package:flutterapp/modules/counter/cubit/status.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {
          if(state is CounterIncrementStates)
            {
              print("Increment");

            }
          if(state is CounterDecrementStates)
          {
            print("Decrement");

          }

        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "minus",
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      "minus",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Text(CounterCubit.get(context).count.toString()),
                  SizedBox(width: 20.0,),
                  FloatingActionButton(
                    heroTag: "add",
                    onPressed: () {
                      CounterCubit.get(context).add();
                    },
                    child: Text(
                      "add",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  }
}
