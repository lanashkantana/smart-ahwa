import 'package:flutter/material.dart';
import '../services/order_service.dart';
import '../services/report_service.dart';
import 'orders_tab.dart';
import 'reports_tab.dart';
import 'order_form_dialog.dart';

class HomePage extends StatefulWidget {
  final OrderService orderService;
  final ReportService reportService;
  const HomePage({Key? key, required this.orderService, required this.reportService}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _tabs = ['Orders', 'Reports'];

  void _showAddOrderDialog() async {
    final result = await showDialog<OrderFormResult>(
      context: context,
      builder: (_) => OrderFormDialog(),
    );
    if (result != null) {
      await widget.orderService.placeOrder(result.customer, result.drink, result.notes);
      setState(() {});
    }
  }

  Future<void> _completeOrder(String id) async {
    await widget.orderService.completeOrder(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OrdersTab(orderService: widget.orderService, onComplete: _completeOrder),
      ReportsTab(reportService: widget.reportService),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Smart Ahwa Manager — ${_tabs[_selectedIndex]}')),
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _showAddOrderDialog,
              child: Icon(Icons.add),
              tooltip: 'Add Order',
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
    );
  }
}
