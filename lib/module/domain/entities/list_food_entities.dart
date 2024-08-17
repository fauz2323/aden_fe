class ListFoodEntities {
  final String message;
  final List<FoodEntities> listFood;

  ListFoodEntities({required this.message, required this.listFood});
}

class FoodEntities {
  final String name;
  final String uuid;
  final int price;
  final String description;
  final String status;
  final String stock;
  final String image;
  final DateTime date;
  final String category;
  final String categorySlug;

  FoodEntities(
      {required this.name,
      required this.image,
      required this.uuid,
      required this.price,
      required this.description,
      required this.status,
      required this.stock,
      required this.date,
      required this.category,
      required this.categorySlug});
}
