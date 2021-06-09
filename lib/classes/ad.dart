class Ad {
  int id;
  String givenProductName;
  String givenProductImage;
  String desiredProductName;
  String desiredProductImage;
  DateTime postDate;

  Ad({
    required this.id,
    required this.givenProductName,
    required this.givenProductImage,
    required this.desiredProductName,
    required this.desiredProductImage,
    required this.postDate,
  });
}

List<Ad> ads = [
  Ad(
    id: 0,
    givenProductName: "mi band 5",
    givenProductImage: "images/product1.png",
    desiredProductName: "iphone 11",
    desiredProductImage: "images/product2.png",
    postDate: DateTime.parse("2021-06-08 20:18:04"),
  ),
  Ad(
    id: 1,
    givenProductName: "mi band 5",
    givenProductImage: "images/product1.png",
    desiredProductName: "iphone 11",
    desiredProductImage: "images/product2.png",
    postDate: DateTime.parse("2021-06-07 20:18:04"),
  ),
  Ad(
    id: 2,
    givenProductName: "mi band 5",
    givenProductImage: "images/product1.png",
    desiredProductName: "iphone 11",
    desiredProductImage: "images/product2.png",
    postDate: DateTime.parse("2021-06-06 20:18:04"),
  ),
];
