import 'package:counter_cubit/cubit/internet_cubit.dart';
import 'package:counter_cubit/presentation/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/count_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  
  final Color color;
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counter = context.read<CountCubit>();

    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
         backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state){
                if(state is InternetConnectedWifi){
                  return Text('Wifi',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.green,
                  ),);
                }
                else if(state is InternetConnectedMobile){
                  return Text('Mobile',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),);
                }
                else if(state is InternetDisconnected){
                  return Text('Disconnected',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color:  Colors.grey,
                  ),);
                }
                else{
                   return CircularProgressIndicator();
                }
               
              }),
            Text('You have pushed the button this many times: '),
            BlocConsumer<CountCubit, CountState>(
              listener: (context, state)  {
                if(state.wasIncremented == true){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content:Text('Incremented'),
                    duration: Duration(milliseconds: 300),)
                  );
                }
                  else if(state.wasIncremented == false){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),)
                    );
                  }
                },
                builder: (context, state) {
                  if(state.counterValue < 0){
                    return Text('BRR, Negative' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,);
                  }
                  else if (state.counterValue % 2 == 0){
                    return Text(
                      'YAAY' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  else if(state.counterValue == 5){
                    return Text(
                      'HMM, Number 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  else{
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
                
              
            ),
            // SizedBox(
            //   height: 24,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: Text('${widget.title}'),
            //       onPressed: () {
            //         BlocProvider.of<CountCubit>(context).decrement();
            //       },
            //       tooltip: 'Decrement',
            //       child: Icon(
            //         Icons.remove
            //       ),),
            //       FloatingActionButton(
            //         heroTag: Text('${widget.title} #2'),
            //         onPressed: () {
            //           BlocProvider.of<CountCubit>(context).increment();
            //           //context.bloc<CountCubit>().increment();
            //         },
            //         tooltip: 'increment',
            //         child: Icon(Icons.add),)
            //   ],
            // ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder:
                  (_) => BlocProvider.value( //alutin context(instance ) ekak hadana eka walakwanna underscore eka use krnawa
                    value: BlocProvider.of<CountCubit>(context),
                    child: SecondScreen(
                        title: 'Second Screen',
                         
                        color: Colors.redAccent
                    ),
                  )));
              },
              child: Text('Go to second page'),
            ),
            SizedBox(
              height: 24,
            )
             
          ],
        ),
      ),
    );
  }
 
}
