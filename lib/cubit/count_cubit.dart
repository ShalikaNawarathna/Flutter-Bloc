import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_cubit/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CountCubit({required this.internetCubit}) : 
    super(CountState(0, true)){
      monitorInternetCubit();
    }

   StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.listen((internetState) { 
       if(internetState is InternetConnectedWifi ){
          increment();
        }
        else if(internetState is InternetConnectedMobile ){
            decrement();
    }
       
         });
    

   }

  void increment() =>emit(CountState(
     state.counterValue + 1, 
    true));

   void decrement() =>emit(CountState(
     state.counterValue - 1, 
    false));

    @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }




}
