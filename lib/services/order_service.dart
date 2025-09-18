import '../models/order.dart';
import '../repository/order_repository.dart';
import '../models/drink_type.dart';

class OrderService {
  final OrderRepository repo;
  OrderService(this.repo);

  Future<void> placeOrder(String customer, DrinkType drink, String notes) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final ord = Order(id: id, customerName: customer, drink: drink, notes: notes);
    await repo.addOrder(ord);
  }

  Future<List<Order>> pendingOrders() => repo.fetchByStatus(OrderStatus.pending);
  Future<List<Order>> completedOrders() => repo.fetchByStatus(OrderStatus.completed);
  Future<List<Order>> allOrders() => repo.fetchAll();

  Future<void> completeOrder(String id) async {
    final all = await repo.fetchAll();
    final found = all.firstWhere((o) => o.id == id, orElse: () => throw Exception('Order not found'));
    found.markCompleted();
    await repo.updateOrder(found);
  }
}
