import 'package:flutter/material.dart';

import 'models/drink_type.dart';
import 'models/order.dart';
import 'repository/in_memory_order_repository.dart';
import 'services/order_service.dart';
import 'services/report_service.dart';
import 'ui/home_page.dart';

void main() {
  runApp(AhwaApp());
}

class AhwaApp extends StatelessWidget {
  final repo = InMemoryOrderRepository();

  AhwaApp({super.key}) {
    // seed demo
    repo.addOrder(Order(id: '1', customerName: 'Ali', drink: DrinkType.shai, notes: 'extra mint'));
    repo.addOrder(Order(id: '2', customerName: 'Sara', drink: DrinkType.turkishCoffee, notes: 'ya rais'));
    final o3 = Order(id: '3', customerName: 'Hany', drink: DrinkType.hibiscus, notes: 'less sugar');
    o3.markCompleted();
    repo.addOrder(o3);
  }

  @override
  Widget build(BuildContext context) {
    final orderService = OrderService(repo);
    final reportService = ReportService(repo);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Ahwa Manager',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: HomePage(orderService: orderService, reportService: reportService),
    );
  }
}
