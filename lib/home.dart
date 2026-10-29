import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_2/counter_provider.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final counter =context.watch<CounterProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("provider counter")),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
  Container(
    padding:  EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    margin:  EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(60),
      border: Border.all(
        color: const Color.fromARGB(255, 240, 243, 33),
        width: 6,
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CounterProvider>().increment();
          },
          child: Container(
            padding:  EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 40,),

        Text(
          "Count: ${counter.count}",
          style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(width: 40),

         GestureDetector(
          onTap: () {
            context.read<CounterProvider>().decrement();
          },
          child: Container(
            padding:  EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  ),
],
         ) ,
         SizedBox(height: 40
        ),
      Center(
        
  child: ElevatedButton(
    onPressed: () {
      context.read<CounterProvider>().reset();
    },
    child:  Text("Reset"),
  ),
)
        ],
      ),
    );
  }
}