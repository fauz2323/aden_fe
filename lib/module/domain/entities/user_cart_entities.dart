class UserCartEntities {
  final String message;
  final List<UserCartItemsEntities> items;

  const UserCartEntities({required this.message, required this.items});
}

class UserCartItemsEntities {
  final String name;
  final int price;
  final String image;
  final int quantity;
  final String uuid;

  UserCartItemsEntities(
      {required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.uuid});
}
