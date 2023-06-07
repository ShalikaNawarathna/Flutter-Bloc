part of 'count_cubit.dart';

// @immutable
// abstract class CountState {
//   CountState(int i, bool bool);
// }

class  CountState{
  final int counterValue;
  final bool wasIncremented;

  CountState(
    this.counterValue,
    this.wasIncremented, 
  );
  
 
}
