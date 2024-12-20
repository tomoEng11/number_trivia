import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(FakeUri()); // TODO これ書かないとエラーになる
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200),);
  }

  void setUpMockHttpClientFailure404() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel =
    NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(() =>
            mockHttpClient.get(
              Uri.parse('http://numbersapi.com/$tNumber'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber), throwsA(const TypeMatcher<ServerException>()));
      },
    );

    group('getRandomNumberTrivia', () {
      const tNumber = 1;
      final tNumberTriviaModel =
      NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

      test(
        'should preform a GET request on a URL with random endpoint and with application/json header',
            () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          await dataSource.getRandomNumberTrivia();
          // assert
          verify(() =>
              mockHttpClient.get(
                Uri.parse('http://numbersapi.com/random'),
                headers: {'Content-Type': 'application/json'},
              ));
        },
      );

      test(
        'should return NumberTrivia when the response code is 200 (success)',
            () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          final result = await dataSource.getRandomNumberTrivia();
          // assert
          expect(result, tNumberTriviaModel);
        },
      );

      test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          setUpMockHttpClientFailure404();
          // act
          final call = dataSource.getRandomNumberTrivia;
          // assert
          expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
        },
      );
    });
  });
}
