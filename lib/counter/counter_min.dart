import 'package:flutter/material.dart';
import 'package:providder/counter/counter_view.dart';
import 'package:provider/provider.dart';

class Decrement extends StatelessWidget {
  const Decrement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){
        // Provider.of<CounterView>(context, listen: false).decrement();
        context.read<CounterView>().decrement();
      }
              , child: Text('<<',style: TextStyle(fontSize: 30),)),
    );
  }
}