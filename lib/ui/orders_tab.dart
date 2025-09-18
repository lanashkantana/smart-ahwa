import 'package:flutter/material.dart';
import 'package:task1/models/drink_type.dart';

import '../models/order.dart';
import '../services/order_service.dart';

class OrdersTab extends StatefulWidget {
  final OrderService orderService;
  final Future<void> Function(String id) onComplete;
  const OrdersTab({super.key, required this.orderService, required this.onComplete});

  @override
  _OrdersTabState createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: widget.orderService.pendingOrders(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        final orders = snapshot.data!;
        if (orders.isEmpty) return Center(child: Text('No pending orders'));
        return  ListView.separated(
  padding: EdgeInsets.all(12),
  itemCount: orders.length,
  separatorBuilder: (_, __) => SizedBox(height: 8),
  itemBuilder: (context, i) {
    final o = orders[i];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.local_cafe, color: Colors.brown),
        title: Text('${o.customerName} — ${o.drink.label}'),
        subtitle: Text(o.notes.isNotEmpty ? o.notes : "No notes"),
        trailing: ElevatedButton.icon(
          icon: Icon(Icons.check),
          label: Text('Complete'),
          onPressed: () async {
            await widget.onComplete(o.id);
            setState(() {});
          },
        ),
      ),
    );
  },
);

      },
    );
  }
}
