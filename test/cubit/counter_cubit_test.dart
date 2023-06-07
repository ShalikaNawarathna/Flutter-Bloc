// import 'package:bloc_test/bloc_test.dart';
// import 'package:counter_cubit/cubit/count_cubit.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:counter_cubit/cubit/count_state.dart';

// void main(){
//   group('CountCubit', () {
//     CountCubit countCubit = CountCubit();

//     setUp(() {
//       countCubit = CountCubit();
//     });

//     tearDown(() {
//       countCubit.close();
//     });

//     test('The initial state of the counter cubit is CounteState(countValue: 0 ),', () {
//       expect(countCubit.state, CountCubit(counterValue:0 ));
//     });

//     blocTest(
//       'the cubit should emit a counterState(cunterVale : 1, wasIncreamented :  true) when cubit.incemnet ',
//       build: () => countCubit,
//       act: (cubit) => cubit.increment(),
//       expect: [CountState(counterValue : 1, wasIncremented : true)], 
//       );

//         blocTest(
//       'the cubit should emit a counterState(cunterVale : -1, wasIncreamented :  false ) when cubit.decremenet is called ',
//       build: () => countCubit,
//       act: (cubit) => cubit.decrement(),
//       expect: [CountState(counterValue : -1, wasIncremented : false)], 
//       );
//   });
// }