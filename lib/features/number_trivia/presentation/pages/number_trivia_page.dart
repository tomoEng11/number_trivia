

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/number_trivia_page_view_model.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final viewModel = ref.watch(numberTriviaPageViewModelProvider.notifier);
            final state = ref.watch(numberTriviaPageViewModelProvider);
            return Column(
              children: [
                Text(state.number.toString()),
                Text(state.text),
                TextField(),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Search'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Get random number'),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
