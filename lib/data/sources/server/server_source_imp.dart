import 'dart:convert';
import 'dart:io';

import 'package:clean_tdd_bloc/core/error/expections.dart';
import 'package:clean_tdd_bloc/data/models/item_model.dart';
import 'package:clean_tdd_bloc/data/sources/server/server_source.dart';
import 'package:http/http.dart' as http;

class ServerSourceImp implements ServerSource {
  final http.Client client;

  const ServerSourceImp({
    required this.client,
  });

  @override
  Future<List<ItemModel>> findItems() async {
    try {
      final result = await client.get(Uri.parse("http://localhost:3000/items"));
      if (result.statusCode == 200) {
        List<ItemModel> items = (jsonDecode(result.body) as List)
            .map((item) => ItemModel.fromJson(item))
            .toList();
        return items;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
