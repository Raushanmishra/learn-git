import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GroceryShoppingPage(),
  ));
}

class GroceryShoppingPage extends StatefulWidget {
  @override
  _GroceryShoppingPageState createState() => _GroceryShoppingPageState();
}

class _GroceryShoppingPageState extends State<GroceryShoppingPage> {
  final List<GroceryItem> groceryItems = [
    GroceryItem(name: "🍎 Apples", price: 2.99),
    GroceryItem(name: "🍌 Bananas", price: 1.99),
    GroceryItem(name: "🥛 Milk", price: 3.49),
    GroceryItem(name: "🍞 Bread", price: 2.49),
    // Add more grocery items as needed
  ];

  final List<CartItem> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Shopping Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groceryItems[index].name),
            subtitle: Text('\$${groceryItems[index].price.toStringAsFixed(2)}'),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  _addToCart(groceryItems[index]);
                });
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void _addToCart(GroceryItem item) {
    final existingItem = cart.firstWhere(
      (cartItem) => cartItem.item == item,
    );
    if (existingItem == null) {
      cart.add(CartItem(item: item, quantity: 1));
    } else {
      existingItem.quantity++;
    }
  }
}

class GroceryItem {
  final String name;
  final double price;

  GroceryItem({required this.name, required this.price});
}

class CartItem {
  final GroceryItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}

class ShoppingCartPage extends StatelessWidget {
  final List<CartItem> cart;

  ShoppingCartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart[index].item.name),
            subtitle: Text('Quantity: ${cart[index].quantity}'),
            trailing: Text(
              '\$${(cart[index].item.price * cart[index].quantity).toStringAsFixed(2)}',
            ),
          );
        },
      ),
    );
  }
}
