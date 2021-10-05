class animalData {
  String vocab;
  String url;
  List<dynamic> choices = [];

  animalData({
    this.vocab = '',
    this.url = '',
    required this.choices,
  });
}

List demoAnimalList = [
  animalData(
    vocab: "fox",
    url: "assets/images/fox.jpg",
    choices: [
      {'vocab': "fox"},
      {'vocab': "giraffe"}
    ],
  ),
  animalData(
    vocab: "camel",
    url: "assets/images/camel.jpg",
    choices: [
      {'vocab': "camel"},
      {'vocab': "horse"}
    ],
  ),
  animalData(
    vocab: "giraffe",
    url: "assets/images/giraffe.jpg",
    choices: [
      {'vocab': "giraffe"},
      {'vocab': "fox"}
    ],
  ),
  animalData(
    vocab: "horse",
    url: "assets/images/horse.jpg",
    choices: [
      {'vocab': "horse"},
      {'vocab': "panda"}
    ],
  ),
  animalData(
    vocab: "monkey",
    url: "assets/images/monkey.jpg",
    choices: [
      {'vocab': "monkey"},
      {'vocab': "tiger"}
    ],
  ),
  animalData(
    vocab: "panda",
    url: "assets/images/panda.jpg",
    choices: [
      {'vocab': "panda"},
      {'vocab': "camel"}
    ],
  ),
  animalData(
    vocab: "tiger",
    url: "assets/images/tiger.jpg",
    choices: [
      {'vocab': "tiger"},
      {'vocab': "zebra"}
    ],
  ),
  animalData(
    vocab: "zebra",
    url: "assets/images/zebra.jpg",
    choices: [
      {'vocab': "zebra"},
      {'vocab': "monkey"}
    ],
  ),
];
