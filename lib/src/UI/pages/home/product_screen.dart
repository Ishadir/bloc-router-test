import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/bloc/counter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(Increment());
                      },
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(Reset());
                      },
                      child: Text('Reset'),
                    ),
                  ],
                ),
                Text(
                  'PRODUCT: $id',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
