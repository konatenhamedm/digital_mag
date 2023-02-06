import 'package:equatable/equatable.dart';

class Article extends Equatable{
  int? id;
  String? titre;
  String? auteur;
  String? imageUrl;
  String? desc;
  String? url;
  String? content;
  //DateTime? datePublication;

  Article({required id,
    required this.titre, required this.auteur, required this.imageUrl, required this.desc,this.url,
    required this.content
});


  static List<Article> articles = [
    Article(
      id: 5,
        titre: 'Nous pouvons maintenant comparer des instances ',
        desc: 'Nous pouvons maintenant comparer des instances ',
        content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
        auteur: 'konate hamed',
        imageUrl: 'https://i0.wp.com/www.digital-mag.ci/wp-content/uploads/2022/11/poulh.jpg?w=653&ssl=1',

    ),
    Article(
      id: 6,
      titre: 'Nous pouvons maintenant comparer des instances ',
      desc: 'Nous pouvons maintenant comparer des instances ',
      content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
      auteur: 'konate hamed',
      imageUrl: 'https://i0.wp.com/www.digital-mag.ci/wp-content/uploads/2022/12/Big-data.jpg?w=661&ssl=1',
      //  publishedAt: DateTime.now().subtract(const Duration(hours: 6))

    ),
    Article(
      id: 1,
      titre: 'Nous pouvons maintenant comparer des instances ',
      desc: 'Nous pouvons maintenant comparer des instances ',
      content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
      auteur: 'konate hamed',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKxWJjGKlbwCGCv12IIm4N4hbZHI_uf0Ms7w&usqp=CAU',
      //  publishedAt: DateTime.now().subtract(const Duration(hours: 6))

    ),
    Article(
      id: 2,
      titre: 'Nous pouvons maintenant comparer des instances ',
      desc: 'Nous pouvons maintenant comparer des instances ',
      content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
      auteur: 'konate hamed',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ51khLJEg2PvNM4xu-jT0yXBF0GsUg8dtxbA&usqp=CAU',
      //  publishedAt: DateTime.now().subtract(const Duration(hours: 6))

    ),
    Article(
      id: 3,
      titre: 'Nous pouvons maintenant comparer des instances ',
      desc: 'Nous pouvons maintenant comparer des instances ',
      content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
      auteur: 'konate hamed',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEjhGZPXd2VJnGkIOzkUHWamfKneHLA4StfQ&usqp=CAU',
      //  publishedAt: DateTime.now().subtract(const Duration(hours: 6))

    ),
    Article(
      id: 4,
      titre: 'Nous pouvons maintenant comparer des instances ',
      desc: 'Nous pouvons maintenant comparer des instances ',
      content: 'Nous pouvons maintenant comparer des instances Personcomme avant sans avoir à écrire tout ce passe-partout. Remarque : Equatable est conçu pour fonctionner uniquement avec des objets immuables, de sorte que toutes les variables membres doivent être finales ',
      auteur: 'konate hamed',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA7vXS88GDP0NIvFNBoHV_OMGN_DQ9MPII7A&usqp=CAU',
      //  publishedAt: DateTime.now().subtract(const Duration(hours: 6))

    ),




  ];

  @override
  // TODO: implement props
  List<Object?> get props => [
   titre,
 auteur,
 imageUrl,
   desc,
   url,
  content,
  ];
}