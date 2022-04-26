import 'package:clean_tdd_bloc/injection.dart';
import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:clean_tdd_bloc/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ItemBloc>()..add(OnFindItems()),
          )
        ],
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
