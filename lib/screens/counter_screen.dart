import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:encrypted_counter/providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  final String title = 'Encrypted Counter';

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            tooltip: 'Decrement',
            icon: const Icon(Icons.history),
            key: const Key('decrementButton'),
            onPressed: () => counter.decrement(),
          ),
        ],
      ),
      body: _buildBody(context, counter),
      floatingActionButton: _floatingAB(context, counter),
    );
  }

  Widget _buildBody(BuildContext context, CounterProvider counter) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            _textResult(context, counter),
          ],
        ),
      ),
    );
  }

  Widget _textResult(BuildContext context, CounterProvider counter) {
    return FutureBuilder(
      future: counter.readItem(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                '${snapshot.data}',
                key: const Key('counterState'),
                style: Theme.of(context).textTheme.headline4,
              );
            }
        }
      },
    );
  }

  Widget _floatingAB(BuildContext context, CounterProvider counter) {
    return FloatingActionButton(
      tooltip: 'Increment',
      child: const Icon(Icons.add),
      key: const Key('incrementFAB'),
      onPressed: () => counter.increment(),
    );
  }
}
