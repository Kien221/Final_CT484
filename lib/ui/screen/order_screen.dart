import 'package:flutter/material.dart';
import 'package:myapp/ui/order/order_item.dart';
import 'package:myapp/ui/order/order_manage.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn Hàng Của Bạn'),
      ),
      body: Consumer<OrdersManager>(
        builder: (ctx, orderData, child) => ListView.builder(
          itemCount: orderData.orderCount,
          itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
        ),
      ),
    );
  }
}
