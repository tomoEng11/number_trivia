import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/number_trivia_state.dart';

part 'number_trivia_page_view_model.g.dart';

@riverpod
final class NumberTriviaPageViewModel extends _$NumberTriviaPageViewModel {
  @override
  NumberTriviaState build() {
    return const NumberTriviaState(
      number: 0,
      text: ''
    );
  }
  Future<void> init() async {}
}