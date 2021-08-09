import 'package:flutter/material.dart';
import 'package:providder/counter/counter_view.dart';
import 'package:provider/provider.dart';

class Increment extends StatelessWidget {
  const Increment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){
        context.read<CounterView>().increment();
      }
              , child: Text('>>',style: TextStyle(fontSize: 30),)),
    );
  }
}