
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'number_trivia_provider.dart';
import 'state/number_trivia_state.dart';
import 'package:number_trivia/core/usecases/usecase.dart';

part 'number_trivia_page_view_model.g.dart';

@riverpod
final class NumberTriviaPageViewModel extends _$NumberTriviaPageViewModel {
  @override
  NumberTriviaState build() {
    return const NumberTriviaState(number: 0, text: '');
  }

  final textController = TextEditingController();

  Future<void> getConcreteNumberTrivia(int number) async {
    final usecase = await ref.watch(getConcreteNumberTriviaProvider.future);
    final result = await usecase(Params(number: number));
    result.fold(
          (failure) {
        // 左側の値（失敗）の処理
        print('Error: ${failure.toString()}'); // エラーメッセージを表示
      },
      (trivia) {
        // 右側の値（成功）の処理
        state = state.copyWith(
          text: trivia.text,
          number: trivia.number,
        );
      },
    );
  }

  Future<void> getRandomNumberTrivia() async {
    final usecase = await ref.watch(getRandomNumberTriviaProvider.future);
    final result = await usecase(NoParams());
    result.fold(
      (failure) {
        // 左側の値（失敗）の処理
        print('Error: ${failure.toString()}'); // エラーメッセージを表示
      },
      (trivia) {
        // 右側の値（成功）の処理
        state = state.copyWith(
          text: trivia.text,
          number: trivia.number,
        );
      },
    );
  }
}
