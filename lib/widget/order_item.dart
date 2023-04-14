import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recap_shops/providers/orders.dart'
    as ord; // using as ord becauseif you notice order item was use to create a class in orders provider so we need to configure to ord.orderitem has a refrence

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
              title: Text(
                '\$${order.amount}',
              ),
              subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
              ),
              trailing:
                  IconButton(onPressed: null, icon: Icon(Icons.expand_more)))
        ],
      ),
    );
  }
}
