import 'package:clean_tdd_bloc/data/sources/network/network_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_source_imp_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkSourceImp networkSource;
  late MockInternetConnectionChecker checker;

  setUp(() {
    checker = MockInternetConnectionChecker();
    networkSource = NetworkSourceImp(checker: checker);
  });

  test('should return data from checker', () async {
    when(checker.hasConnection).thenAnswer((_) async => true);
    final result = await networkSource.isOnline();
    expect(result, true);
  });
}
