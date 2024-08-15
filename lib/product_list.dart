import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'cart_provider.dart';
import 'db_helper.dart';
import 'cart_screen.dart';
import 'cart_model.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final List<Map<String, dynamic>> products = [
      {'name': 'Mango', 'price': 90, 'image': 'https://sadruddin.com/wp-content/uploads/2022/06/mango1.jpg'},
      {'name': 'Watermelon', 'price': 190, 'image': 'https://www.instacart.com/company/wp-content/uploads/2022/04/summer-fruit-5-1024x681.jpg'},
      {'name': 'pomegranate', 'price': 90, 'image': 'https://ucanr.edu/blogs/CCMGBlog/blogfiles/25690_original.jpg'},
      {'name': 'Orange', 'price': 40, 'image': 'https://www.foodcraft.hk/cdn/shop/files/Orange-2pc_700x700.jpg?v=1688025581'},
      {'name': 'Grapes', 'price': 50, 'image': 'https://www.jacksonville.com/gcdn/authoring/2017/01/18/NFTU/ghows-LK-6897c679-f0cc-41d1-8241-d3f5f8dbad35-7a9c6006.jpeg'},
      {'name': 'Banana', 'price': 40, 'image': 'https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg'},
      {'name': 'Apple', 'price': 80, 'image': 'https://www.collinsdictionary.com/images/full/apple_158989157.jpg'},
      {'name': 'Guava', 'price': 80, 'image': 'https://fiercefruit.com/cdn/shop/articles/Whole-and-cut-pink-guava-fruits_5173x.jpg?v=1633970138'},
      {'name': 'Strawberry', 'price': 80, 'image': 'https://i.pinimg.com/originals/db/f0/04/dbf004bfe8522da759eaf94190290aa3.png'},
      {'name': 'Fruit Basket', 'price': 280, 'image': 'https://proflowers.pk/wp-content/uploads/2020/06/FYF-870-1.jpg'},
      {'name': 'Kiwi', 'price': 70, 'image': 'https://panettamercato.com.au/wp-content/uploads/2021/07/Kiwi-Fruit-Kg-Panetta-Mercato.jpeg'},




    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            child: Center(
              child: badges.Badge(
                badgeContent: Text(
                  cartProvider.getCounter().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                badgeAnimation: badges.BadgeAnimation.slide(),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product['image']),
              title: Text(product['name']),
              subtitle: Text('\$${product['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  final cartItem = Cart(
                    id: DateTime.now().millisecondsSinceEpoch,
                    productId: index.toString(),
                    productName: product['name'],
                    initialPrice: product['price'],
                    productPrice: product['price'],
                    quantity: 1,
                    image: product['image'],
                  );
                  cartProvider.addItem(cartItem);
                },
                child: Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}
