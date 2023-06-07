import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_state.dart';

// enum ConnectivityResult{
//   wifi, mobile,
// }
// //purpose of internetCubit is return differnrt kind of internet states
class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription  connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    connectivityStreamSubscription = 
      connectivity.onConnectivityChanged.listen((ConnectivityResult) {
        print(ConnectivityResult.name);
        if(ConnectivityResult.name == ConnectionType.wifi.name){
          emit(InternetConnectedWifi());
          
        }
        else if(ConnectivityResult.name == ConnectionType.mobile.name){
          emit(InternetConnectedMobile());
        }
        else if(ConnectivityResult.name == ConnectionType.values.singleOrNull){
          emitInternetDisconnected();
        }
       });
  }

  // void emitInternetConnected(ConnectionType _connectionType) => 
  //   emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => 
    emit(InternetDisconnected());

  @override
  Future<void> close(){
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
