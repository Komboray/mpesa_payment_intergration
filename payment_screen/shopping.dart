import 'package:flutter/material.dart';
import 'package:mpesa/provider/counter.dart';
import 'package:mpesa/provider/shoppingcart.dart';
import 'package:provider/provider.dart';


class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.watch<Counter>().count}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<ShoppingCart>().count}'),
            Text('${context.watch<ShoppingCart>().cart}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_floatingActionButton'),
        onPressed: () {
          context.read<ShoppingCart>().addItems('Bread');
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
