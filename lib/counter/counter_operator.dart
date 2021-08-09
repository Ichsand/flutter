import 'package:flutter/material.dart';
import 'package:providder/counter/counter_plus.dart';
import 'package:providder/counter/counter_min.dart';

class CounterOperator extends StatelessWidget {
  const CounterOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Decrement(),
        Increment()
      ],),
    );
  }
}