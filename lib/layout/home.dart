import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/cubit/cubit.dart';
import 'package:flutterapp/layout/cubit/states.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (BuildContext context, state) {

      },
      builder: (BuildContext context, state) {
        var myCurrentIndex = HomeCubit.get(context).currentIndex;
        var myCubit = HomeCubit.get(context) ;
        return Scaffold(
          appBar: AppBar(
            title: Text(myCubit.myTitles[myCurrentIndex]),
          ),
          body: myCubit.myWidgets[myCurrentIndex],
          drawer: Drawer(
            child: ListView.builder(
                itemBuilder: (context, index) => listItemDrawer(myCubit.myTitles[index],index,context),

              itemCount: myCubit.myWidgets.length,
            ),

          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Business"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Sports"),
            ],
            onTap: (index) {
              myCubit.onchangeIndex(index);
            },
            currentIndex: myCurrentIndex,
          ),
        );
      },
    );
  }

  Widget listItemDrawer(title,index,context){
    return  ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_rounded),
      onTap: (){
        HomeCubit.get(context).onchangeIndex(index);
        Navigator.pop(context);
      },
      selected:  HomeCubit.get(context).selectedItems[index],
    );
  }
}
