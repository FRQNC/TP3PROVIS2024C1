import 'package:tp3_provis/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductListCubit extends Cubit<List<ProductModel>> {
  String url = "https://dummyjson.com/products"; // Ganti dengan URL API yang sesuai
  ProductListCubit() : super([]);

  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['products'];
    List<ProductModel> productList = data.map((e) => ProductModel(
      id: e['id'],
      title: e['title'],
      description: e['description'],
      price: e['price'],
      discountPercentage: e['discountPercentage'],
      rating: e['rating'],
      stock: e['stock'],
      brand: e['brand'],
      category: e['category'],
      thumbnail: e['thumbnail'],
      images: List<String>.from(e['images']),
    )).toList();
    emit(productList);
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}