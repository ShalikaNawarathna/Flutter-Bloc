part of 'internet_cubit.dart';

enum ConnectionType{
  wifi,
   mobile,
}
abstract class InternetState extends Equatable {
  const InternetState();
  
  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

// class InternetConnected extends InternetState{
//   final ConnectionType connectionType;

//   InternetConnected({required this.connectionType});
// }


class InternetConnectedWifi extends InternetState{
  

}
class InternetConnectedMobile extends InternetState{
  
  
}


class InternetDisconnected extends InternetState{}
