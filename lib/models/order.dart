import 'drink_type.dart';

enum OrderStatus { pending, completed }

class Order {
  final String id;
  final String customerName;
  final DrinkType drink;
  final String notes;
  final DateTime createdAt;
  OrderStatus _status = OrderStatus.pending;

  Order({
    required this.id,
    required this.customerName,
    required this.drink,
    required this.notes,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  OrderStatus get status => _status;

  void markCompleted() {
    _status = OrderStatus.completed;
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'customerName': customerName,
        'drink': drink.index,
        'notes': notes,
        'createdAt': createdAt.toIso8601String(),
        'status': _status.index,
      };
}
