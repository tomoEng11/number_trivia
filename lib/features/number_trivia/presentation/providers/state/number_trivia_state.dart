
import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_trivia_state.freezed.dart';

@freezed
class NumberTriviaState with _$NumberTriviaState {
  const factory NumberTriviaState({
    required int number,
    required String text,
  }) = _NumberTriviaState;
}