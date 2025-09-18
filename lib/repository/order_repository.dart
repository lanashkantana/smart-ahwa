import '../models/order.dart';

abstract class OrderRepository {
  Future<void> addOrder(Order order);
  Future<List<Order>> fetchAll();
  Future<void> updateOrder(Order order);
  Future<List<Order>> fetchByStatus(OrderStatus status);
  Future<void> clearAll();
}
