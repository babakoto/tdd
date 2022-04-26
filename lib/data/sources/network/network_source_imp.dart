import 'package:clean_tdd_bloc/data/sources/network/network_source.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkSourceImp implements NetworkSource {
  final InternetConnectionChecker checker;

  @override
  Future<bool> isOnline() async {
    return checker.hasConnection;
  }

  const NetworkSourceImp({
    required this.checker,
  });
}
