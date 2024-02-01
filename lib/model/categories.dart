class Categories {
  int index;
  String name;

  Categories({
    required this.index,
    required this.name,
  });

  static List<Categories> upCategoryList = [
    Categories(index: 0, name: "Enerji"),
    Categories(index: 1, name: "Spor"),
    Categories(index: 2, name: "Rahatlama"),
    Categories(index: 3, name: "İş/Ev"),
    Categories(index: 4, name: "Odaklanma"),
  ];
}
