// ignore_for_file: file_names

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> items = [];
  int _counter = 0;

  void _addItem() {
    setState(() {
      items.add(_counter);
      _counter++;
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

   String getType(int number) {
    if (isPrime(number)) {
      return 'nombre premier';
    } else if (number % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('$_counter'' : ''${getType(_counter)}'),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final itemValue = items[index];
          final isEven = itemValue % 2 == 0;
          final isPrimeNumber = isPrime(itemValue);
          final backgroundColor = isEven ? Colors.cyan : Colors.indigo;
          const textColor = Colors.white;
          final imageAsset = isPrimeNumber
              ? 'images/ananas.png'
              : isEven
                  ? 'images/poire.png'
                  : 'images/pomme.png';
          return Container(
            color: backgroundColor,
            child: ListTile(
              leading: Image.asset(
                imageAsset,
                width: 40,
                height: 40,
              ),
              title: Text(
                '$itemValue',
                style: const TextStyle(color: textColor),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
