import 'dart:convert';

import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/core/error/expections.dart';
import 'package:clean_tdd_bloc/data/models/item_model.dart';
import 'package:clean_tdd_bloc/data/sources/server/server_source_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'server_source_imp_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ServerSourceImp serverSourceImp;
  late MockClient client;

  setUp(() {
    client = MockClient();
    serverSourceImp = ServerSourceImp(client: client);
  });

  String jsonData = """
  [
{
"id": 1,
"name": "Iphone5",
"price": 250
},
{
"id": 2,
"name": "Samsung",
"price": 500
},
{
"id": 3,
"name": "Nokia",
"price": 150
},
{
"id": 4,
"name": "ZTE",
"price": 50
}
]
  """;
  test("Get request and status 200", () async {
    when(client.get(Uri.parse("http://localhost:3000/items")))
        .thenAnswer((_) async => http.Response(jsonData, 200));

    List<ItemModel> tItemsModel = (jsonDecode(jsonData) as List)
        .map((item) => ItemModel.fromJson(item))
        .toList();

    // ACT
    final result = await serverSourceImp.findItems();
    expect(
      result,
      tItemsModel,
    );
  });

  test("Get request and status 400", () async {
    when(client.get(Uri.parse("http://localhost:3000/items"))).thenAnswer(
      (_) async => http.Response('message error', 400),
    );
    // ACT
    final result = serverSourceImp.findItems();
    expect(result, throwsA(const TypeMatcher<ServerException>()));
  });
}
