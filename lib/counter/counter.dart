import 'package:flutter/material.dart';
import 'package:providder/counter/counter_operator.dart';
import 'package:providder/counter/counter_view.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  // ignore: non_constant_identifier_names
  incr_Counter(){
    setState((){
      counter++;
    });
  }
  // ignore: non_constant_identifier_names
  dcr_Counter(){
    setState((){
    counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(appBar: AppBar(title: Text('counter'),),
    body: ChangeNotifierProvider(
      create: (context) => CounterView(),
      builder: (context, child){
        return Column(children: [
          Text('${context.watch<CounterView>().counter}',
          style: TextStyle(fontSize: 30.0)),
          CounterOperator()
        ],);
      },
    )
    ));
  }
}