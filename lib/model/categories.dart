class Categories {
  int index;
  String name;

  Categories({
    required this.index,
    required this.name,
  });

  static List<Categories> upCategoryList = [
    Categories(index: 0, name: "Enerjik"),
    Categories(index: 1, name: "Keyifli"),
    Categories(index: 2, name: "Rahatlama"),
    Categories(index: 3, name: "Romantik"),
    Categories(index: 4, name: "Antrenman"),
    Categories(index: 5, name: "İş/Ev"),
    Categories(index: 6, name: "Odaklanma"),
  ];
}
