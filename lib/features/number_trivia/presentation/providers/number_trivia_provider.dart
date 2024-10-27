import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/network_info.dart';
import '../../data/datasources/number_trivia_local_data_source.dart';
import '../../data/datasources/number_trivia_remote_data_source.dart';
import '../../data/repositories/number_trivia_repository_impl.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';

// Shared Preferences(local)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
});

// http(remote)
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

// NetworkInfo
final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(connectionChecker: InternetConnection.createInstance()));

// RemoteDataSource
final numberTriviaRemoteDataSourceProvider = Provider<NumberTriviaRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return NumberTriviaRemoteDataSourceImpl(client: client);
});

// LocalDataSource
final numberTriviaLocalDataSourceProvider = FutureProvider<NumberTriviaLocalDataSource>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future); // .futureを使ってawaitする
  return NumberTriviaLocalDataSourceImp(sharedPreferences: sharedPreferences);
});

// Repository
final numberTriviaRepositoryProvider = FutureProvider<NumberTriviaRepository>((ref) async {
  final remoteDataSource = ref.watch(numberTriviaRemoteDataSourceProvider);
  final localDataSource = await ref.watch(numberTriviaLocalDataSourceProvider.future);
  final networkInfo = ref.watch(networkInfoProvider);
  return NumberTriviaRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource, networkInfo: networkInfo);
});

// UseCase
final getConcreteNumberTriviaProvider = FutureProvider<GetConcreteNumberTrivia>((ref) async {
  final repository = await ref.watch(numberTriviaRepositoryProvider.future);
  return GetConcreteNumberTrivia(repository);
});

final getRandomNumberTriviaProvider = FutureProvider<GetRandomNumberTrivia>((ref) async {
  final repository = await ref.watch(numberTriviaRepositoryProvider.future);
  return GetRandomNumberTrivia(repository);
});





