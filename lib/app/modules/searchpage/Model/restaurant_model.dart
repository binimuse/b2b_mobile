class RestaurantModel {
  late int id;
  late String name;
  late String tag;
  late String image;
  late String phone;
  late double rating;
  late double distance;
  late String promo;
  late String location;

  RestaurantModel(
      {required this.id,
      required this.name,
      required this.tag,
      required this.image,
      required this.rating,
      required this.phone,
      required this.distance,
      required this.promo,
      required this.location});
}
