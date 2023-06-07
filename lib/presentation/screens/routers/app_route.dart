import 'package:counter_cubit/cubit/count_cubit.dart';
import 'package:counter_cubit/presentation/screens/home_screen.dart';
import 'package:counter_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../second_screen.dart';

class AppRouter{
  //final CountCubit _countCubit = CountCubit(internetCubit: );
  Route? onGenerateRoute(RouteSettings routeSettings){
//     switch (routeSettings.name) {
//       case ('/'):
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider.value(
//             value : _countCubit,
//             child : HomeScreen(
//               title: 'Home Screen', 
//                color: Colors.blueAccent
//             )
//             )
//           );
//         break;
//         case ('/second'):
//           return MaterialPageRoute(
//           builder: (_) => BlocProvider.value(
//             value: _countCubit,
//             child: SecondScreen(
//               title: 'Second Screen', 
//               color: Colors.redAccent),
//             )
//           );
//         break;
//         case ('/third'):
//           return MaterialPageRoute(
//           builder: (_) => BlocProvider.value(
//             value: _countCubit,
//             child: ThirdScreen(
//               title: 'Third Screen', 
//               color: Colors.greenAccent
//             ),
//             )
//           );
//         break;
//       default:
//         return null;
//     }
//   }
//   void dipose(){
//     _countCubit.close();
//   }
  switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      default:
        return null;
    }
  }
}