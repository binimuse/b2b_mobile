class CategoriesModel {
  late String id;
  late String name;
  late String iamgelink;
  late int children_count;
//  late String children_iamge;

  CategoriesModel({
    required this.name,
    required this.id,
    required this.iamgelink,
    required this.children_count,
    // required this.children_iamge ,
  });
}
