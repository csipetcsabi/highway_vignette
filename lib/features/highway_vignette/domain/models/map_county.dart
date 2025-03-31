class MapCounty {
  String id;
  String path;
  String color;
  String name;
  String strokeMiterlimit;

  MapCounty({
    required this.id,
    required this.path,
    required this.name,
    this.color = 'C4DFE9',
    this.strokeMiterlimit = "10"

  });
}
