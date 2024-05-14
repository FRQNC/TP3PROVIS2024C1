import 'package:flutter/material.dart';
import 'package:tp3_provis/model/product_model.dart';
import 'package:tp3_provis/primary_button.dart';
import 'package:tp3_provis/provider/product_provider.dart';
import 'package:tp3_provis/main_provider.dart';
import 'package:provider/provider.dart';

class MainShopePage extends StatefulWidget {
  const MainShopePage({super.key});

  @override
  State<MainShopePage> createState() => _MainShopePageState();
}

class _MainShopePageState extends State<MainShopePage> with AppMixin {
  @override
  void initState() {
    super.initState();
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "IniShop",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Shop Now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        return productItemView(productProvider.products[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget productItemView(ProductModel product) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${product.price.toString()}",
                    style: const TextStyle(
                      color: Color(0xFF94B0B7),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            PrimaryButton(
              buttonText: "Buy",
              fontSize: 14,
              containerWidth: 90,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}