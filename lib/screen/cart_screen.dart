import 'package:recap_shops/widget/cart_item.dart';
import 'package:recap_shops/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:recap_shops/providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartprov = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Chip(
                    label: Text('\$${cartprov.totalamount.toString()}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: (() {
                        Provider.of<Orders>(context, listen: false).addorder(
                            cartprov.cartitemss.values.toList(),
                            cartprov.totalamount);
                        cartprov
                            .clear(); // this clear the cart page after pressing order
                      }),
                      child: Text('Order Now'))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItem(
              cartprov.cartitemss.values.toList()[i].id,
              cartprov.cartitemss.keys.toList()[i],
              cartprov.cartitemss.values.toList()[i].price,
              cartprov.cartitemss.values.toList()[i].quantity,
              cartprov.cartitemss.values.toList()[i].title,
            ),
            itemCount: cartprov.cartitemss.length,
          ))
        ],
      ),
    );
  }
}
