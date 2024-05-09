import 'package:tp3_provis/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductListCubit extends Cubit<List<ProductModel>> {
  String url = 'https://dummyjson.com/products';
  ProductListCubit() :super([
      ProductModel(
        title: "",
        description: "",
        price: 0,
        thumbnail: ""
      )
    ]);

  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['products'];
    List<ProductModel> productList = data.map((e) => ProductModel(
      title: e['title'],
      description: e['description'],
      price: e['price'],
      thumbnail: e['thumbnail']
    )).toList();
    emit(productList);
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // jika server mengembalikan 200 OK artinya berhasil,
        // parse json, return objek CatFact yang terisi
        setFromJson(jsonDecode(response.body));
      } else {
        // jika gagal (bukan  200 OK),
        // lempar exception
        throw Exception('Gagal panggil API');
    }
  }
}