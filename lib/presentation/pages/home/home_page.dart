import 'package:clean_tdd_bloc/app.dart';
import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:clean_tdd_bloc/presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:clean_tdd_bloc/presentation/pages/detail/detail_page.dart';
import 'package:clean_tdd_bloc/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OK", key: const ValueKey("OK"))),
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
              child: BlocListener<DetailBloc, DetailState>(
                listener: (context, state) {
                  if (state.status == DetailStatus.loaded) {
                    Navigator.of(context).pushNamed(AppRoute.detail);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Error 404"),
                      ),
                    );
                  }
                },
                child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        onTap: () {
                          context
                              .read<DetailBloc>()
                              .add(OnFindItemById(id: state.items[index].id));
                        },
                        title: Text(state.items[index].name),
                      );
                    }),
              ),
            );
          }
        }),
      ),
    );
  }
}
