import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:clean_tdd_bloc/presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
        if (state.status == ItemStatus.notFoundError) {
          print('>>>>>>> ${state.status}');
          return const Center(child: Text("404"));
        } else {
          return Center(child: Text("${state.item?.name}"));
        }
      }),
    );
  }
}
