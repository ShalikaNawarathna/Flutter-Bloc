//import 'package:counter_cubit/cubit/counte_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_cubit/cubit/internet_cubit.dart';
import 'package:counter_cubit/presentation/screens/home_screen.dart';
import 'package:counter_cubit/presentation/screens/routers/app_route.dart';
import 'package:counter_cubit/presentation/screens/second_screen.dart';
import 'package:counter_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'logic/cubit/internet_cubit.dart';
import 'cubit/count_cubit.dart';

void main() {
  //CountCubit countCubit = CountCubit(counterValue: 0);
  // final  CountState countState1= CountState(counterValue : 1);
  // final CountState countState2= CountState(counterValue : 1);
  //print(countState1 == countState2);
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// class MyApp extends StatefulWidget {

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

class MyApp extends StatelessWidget {
  //final CountCubit _countCubit = CountCubit();
  final AppRouter appRouter;
  // This widget is the root of your application.
  final Connectivity connectivity;

  const MyApp({
    Key? key, 
    required this.appRouter,
    required this.connectivity,
     })
    : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: connectivity),
        ),
        BlocProvider<CountCubit>(
          create: (context) => CountCubit(
            internetCubit:  context.read<InternetCubit>()),
        ),
      ],  
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity:VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ));
  }
  // @override
  // void dispose() { //meka acess karannna puluwan stateful class ekakata witrai
  //  _appRouter.dipose();
  //   super.dispose();
  // }
}
