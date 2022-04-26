import 'package:clean_tdd_bloc/data/repositories/item_repository_imp.dart';
import 'package:clean_tdd_bloc/data/sources/local/local_source_imp.dart';
import 'package:clean_tdd_bloc/data/sources/network/network_source_imp.dart';
import 'package:clean_tdd_bloc/data/sources/server/server_source_imp.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/find_items_usecase.dart';
import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'data/sources/local/local_source.dart';
import 'data/sources/network/network_source.dart';
import 'data/sources/server/server_source.dart';
import 'package:http/http.dart' as http;

var getIt = GetIt.instance;

Future init() async {
  /// BLOC
  getIt.registerFactory<ItemBloc>(
    () => ItemBloc(
      findItemsUseCase: getIt<FindItemsUseCase>(),
    ),
  );

  /////// DOMAIN
  /// use cases
  getIt.registerLazySingleton<FindItemsUseCase>(
    () => FindItemsUseCase(
      repository: getIt<ItemRepository>(),
    ),
  );

  /// Repositories
  getIt.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImp(
      serverSource: getIt<ServerSource>(),
      localSource: getIt<LocalSource>(),
      networkSource: getIt<NetworkSource>(),
    ),
  );

  /// SERVICE / Packages
  getIt.registerLazySingleton<ServerSource>(
    () => ServerSourceImp(
      client: http.Client(),
    ),
  );
  getIt.registerLazySingleton<LocalSource>(
    () => LocalSourceImp(),
  );

  getIt.registerLazySingleton<NetworkSource>(
    () => NetworkSourceImp(
      checker: InternetConnectionChecker(),
    ),
  );
}
