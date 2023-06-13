import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/bloc/bloc/counter_bloc.dart';
import '../../../core/models/product.dart';
import '../../../router/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _list = <Product>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 50; i++) {
      final faker = Faker();
      _list.add(
        Product(
          id: i,
          name: faker.food.dish(),
          image: faker.image.image(
            keywords: ['food'],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Container(
        color: Colors.white,
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                    child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 24),
                )),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      final product = _list[index];
                      return Card(
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              Routes.product,
                              extra: BlocProvider.of<CounterBloc>(context),
                              pathParameters: {
                                'id': product.id.toString(),
                              },
                            );
                          },
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(product.image),
                              ),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: _list.length,
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
