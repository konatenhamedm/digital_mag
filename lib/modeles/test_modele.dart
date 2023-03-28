

class TestModele{

  String? name;
  String? price;
  TestModele(
  {
    this.name,
    this.price
}
      );

  TestModele.fromMap(Map map)
      : name = map['name'],
        price = map['price'];


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }
}