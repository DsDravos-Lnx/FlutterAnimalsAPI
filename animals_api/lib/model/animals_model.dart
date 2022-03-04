class Animals {
  final int id;
  final String name;
  final String animalType;
  final String imageLink;

  Animals({
    required this.id,
    required this.name,
    required this.animalType,
    required this.imageLink,
  });

  factory Animals.fromJson(Map<String, dynamic> json) {
    return Animals(
        id: json['id'],
        name: json['name'],
        animalType: json['animal_type'],
        imageLink: json['image_link']);
  }
}
