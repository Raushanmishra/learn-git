import 'package:flutter/material.dart';

void main() {
  runApp(Productlisting());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Productlisting extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'iPhone',
      description: 'Latest iPhone model',
      price: 999.99,
      imageUrl:
          'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    ),
    Product(
      name: 'Pixel 1',
      description: 'Google Pixel 1 smartphone',
      price: 499.99,
      imageUrl:
          'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    ),
    Product(
      name: 'Laptop',
      description: 'High-performance laptop',
      price: 899.99,
      imageUrl:
          'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    ),
    Product(
      name: 'Pendrive',
      description: '128GB USB Pendrive',
      price: 29.99,
      imageUrl:
          'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Listing'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 150,
                height: 150,
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          },
        ),
      ),
    );
  }
}
