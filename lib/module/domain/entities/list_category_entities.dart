class ListCategoryEntities {
  final String message;
  List<CategoryEntities> listCategoryEntities;

  ListCategoryEntities(
      {required this.message, required this.listCategoryEntities});
}

class CategoryEntities {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final DateTime date;

  CategoryEntities(
      {required this.id,
      required this.name,
      required this.slug,
      required this.icon,
      required this.date});
}
