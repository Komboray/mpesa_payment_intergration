import 'package:flutter/material.dart';
import 'package:mpesa/payment_screen/shopping.dart';
import 'package:mpesa/provider/counter.dart';
import 'package:provider/provider.dart';

class Hesabu extends StatelessWidget {
  const Hesabu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MONEY"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*1/4,
          ),
          Center(
            /////to read the values with adding and minus//////////////////////////

            child: Text('You have pressed the number: ${context.watch<Counter>().count}'
            ),

          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                context.read<Counter>().increment();
              }, icon: Icon(Icons.add_circle),),
              IconButton(onPressed: (){
                context.read<Counter>().reset();
              }, icon: Icon(Icons.not_interested_sharp),),
              IconButton(onPressed: (){
                context.read<Counter>().decrement();
              }, icon: Icon(Icons.minimize),),

            ],
          ),
          OutlinedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Shopping()));
          },
              child: Text('Go to cart')),
        ],
      ),
    );
  }
}
///////////////////This one is called because we are expecting the state of the count which is recalled Hesabu by me changes/////////////

class Count extends StatelessWidget{
  Count({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
    key: Key('counterState'), style: Theme.of(context).textTheme.headlineMedium,
    );
  }}
