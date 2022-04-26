import 'package:clean_tdd_bloc/app.dart';
import 'package:clean_tdd_bloc/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  /// GET IT
  init();
  runApp(const Clean());
}

class Clean extends StatelessWidget {
  const Clean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
