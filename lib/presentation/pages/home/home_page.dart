import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state.status == ItemStatus.serverError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Server Error"),
              ),
            );
          }
        },
        child: BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
          if (state.status == ItemStatus.loading) {
            return const Center(child: Text("Loading ...."));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ItemBloc>().add(OnFindItems());
              },
              child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      title: Text(state.items[index].name),
                    );
                  }),
            );
          }
        }),
      ),
    );
  }
}
