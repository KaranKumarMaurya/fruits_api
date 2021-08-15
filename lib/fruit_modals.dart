class fruitModal{
  final String name ;
  final String id;
  final String genus;
  final String family;
  final String order;
  final String nutritions;

  fruitModal({
    required this.name,
    required this.id,
    required this.genus,
    required this.family,
    required this.order,
    required this.nutritions,

  });

  factory fruitModal.fromJson(final json){
    return fruitModal(
      name: json["name"] ,
      id: json["skill"],
      genus: json["education"] ,
      family: json["family"] ,
      order: json["order"],
      nutritions: json["nutritions"] ,
    );
  }

}