import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/number_trivia_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: NumberTriviaPage(),
      ),
    ),
  );
}
