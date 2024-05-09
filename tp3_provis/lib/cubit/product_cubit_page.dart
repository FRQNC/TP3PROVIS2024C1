import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3_provis/cubit/list_product_cubit.dart';
import 'package:tp3_provis/cubit/product_state.dart';


class ProductCubit extends StatelessWidget {
  const ProductCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: Center(
          child: BlocProvider(
            create: (context) => ProductListCubit()..fetchData(), // Inisialisasi cubit dan panggil fetchData()
            child: BlocBuilder<ProductListCubit, List<ProductModel>>(
              builder: (context, productList) {
                if (productList.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return ListTile(
                        title: Text(product.title ?? ''),
                        subtitle: Text(product.description ?? ''),
                        trailing: Text('${product.price ?? 0}'),
                        leading: Image.network(
                          product.thumbnail ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}