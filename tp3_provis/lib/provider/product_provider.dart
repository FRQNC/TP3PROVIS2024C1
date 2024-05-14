import 'package:flutter/material.dart';
import 'package:tp3_provis/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  String url = "https://dummyjson.com/products";

  Future<void> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Extract the products list from the response data
        final List<dynamic> productsJson = responseData['products'];

        _products = productsJson
            .map((product) => ProductModel(
                  id: product['id'],
                  title: product['title'],
                  description: product['description'],
                  price: product['price'],
                  discountPercentage: product['discountPercentage'],
                  rating: product['rating'],
                  stock: product['stock'],
                  brand: product['brand'],
                  category: product['category'],
                  thumbnail: product['thumbnail'],
                  images: List<String>.from(product['images']),
                ))
            .toList();
        notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
