import '../models/order.dart';
import '../repository/order_repository.dart';
import '../models/drink_type.dart';

class ReportService {
  final OrderRepository repo;
  ReportService(this.repo);

  Future<Map<DrinkType, int>> topSellingByDrink() async {
    final all = await repo.fetchAll();
    final Map<DrinkType, int> counts = {for (var t in DrinkType.values) t: 0};
    for (var o in all.where((x) => x.status == OrderStatus.completed)) {
      counts[o.drink] = (counts[o.drink] ?? 0) + 1;
    }
    return counts;
  }

  Future<int> totalServed() async {
    final all = await repo.fetchAll();
    return all.where((x) => x.status == OrderStatus.completed).length;
  }
}
