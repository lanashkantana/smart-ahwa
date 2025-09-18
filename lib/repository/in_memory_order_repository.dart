import 'order_repository.dart';
import '../models/order.dart';

class InMemoryOrderRepository implements OrderRepository {
  final List<Order> _orders = [];

  @override
  Future<void> addOrder(Order order) async {
    _orders.add(order);
  }

  @override
  Future<List<Order>> fetchAll() async => List.unmodifiable(_orders);

  @override
  Future<void> updateOrder(Order order) async {
    final idx = _orders.indexWhere((o) => o.id == order.id);
    if (idx >= 0) _orders[idx] = order;
  }

  @override
  Future<List<Order>> fetchByStatus(OrderStatus status) async =>
      _orders.where((o) => o.status == status).toList();

  @override
  Future<void> clearAll() async {
    _orders.clear();
  }
}
