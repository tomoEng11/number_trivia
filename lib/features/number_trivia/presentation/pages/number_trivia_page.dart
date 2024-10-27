import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.number.toString()),
                Text(state.text),
                TextFormField(
                  controller: viewModel.textController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    hintText: '好きな整数を入力してください',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final number = int.tryParse(viewModel.textController.value.text) ?? 0;
                          viewModel.getConcreteNumberTrivia(number);
                        },
                        child: const Text('Search'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.getRandomNumberTrivia();
                        },
                        child: const Text('Get random number'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
