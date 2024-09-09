import 'package:flutter/material.dart';
import 'widgets/order_item.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All orders',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return const OrderItem(
            date: '01/01/2024',
            id: '#71717-1212',
            price: '17 ₼',
          );
        },
      ),
    );
  }
}
