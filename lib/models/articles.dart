class Article {
  String reference;
  String titre;
  String prix;
  String image;
  Article(
      {required this.reference,
      required this.titre,
      required this.prix,
      required this.image});
}

List<Article> articles = [
  Article(
      reference: "1",
      titre: "Mac book pro",
      prix: "1000 000ariary",
      image: "lib/photos/articles/laptop1.jpg"),
  Article(
      reference: "2",
      titre: "Dell",
      prix: "5000 000 ariary",
      image: "lib/photos/articles/laptop2.jpg"),
  Article(
      reference: '3',
      titre: 'iphone 14pro',
      prix: '6000 000 ariary',
      image: 'lib/photos/articles/iphone.jpg'),
  Article(
      reference: '4',
      titre: 'Casque gaming Sony',
      prix: '600 000 ariary',
      image: 'lib/photos/articles/casquegame.jpg'),
  Article(
      reference: '5',
      titre: 'speacker Jbl boomBox',
      prix: '2 400 000 ariary',
      image: 'lib/photos/articles/speacker2.jpg'),
  Article(
      reference: '6',
      titre: 'speacker bose',
      prix: '3 000 000 ariary',
      image: 'lib/photos/articles/speacker.jpg'),
  Article(
      reference: '7',
      titre: 'casque vr',
      prix: '4000 000 ariary',
      image: 'lib/photos/articles/casquevr.jpg'),
  Article(
      reference: '8',
      titre: 'accesoire vr',
      prix: '8000 000 ariary',
      image: 'lib/photos/articles/vrAccessoire.jpg'),
  Article(
      reference: '9',
      titre: 'manette play station 5',
      prix: '1 200 000 ariary',
      image: 'lib/photos/articles/manette.jpg'),
  Article(
      reference: '10',
      titre: 'accessoire gaming',
      prix: '4000 000 ariary',
      image: 'lib/photos/articles/accessoireGame.jpg'),
  Article(
      reference: "11",
      titre: "Dell",
      prix: "5000 000 ariary",
      image: "lib/photos/articles/laptop2.jpg"),
];
