import '../modeles/categorie.dart';


List<Categorie> getCategorie(){

  List<Categorie> categorie =  List as List<Categorie>;

  Categorie categorieArticle = new Categorie();
  categorieArticle.libelle="mobile";
  categorieArticle.imageUrl="https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80";
  categorie.add(categorieArticle);


  Categorie categorieArticle1 = new Categorie();
  categorieArticle1.libelle="telecom";
  categorieArticle1.imageUrl="https://images.unsplash.com/photo-1592862037671-e8b981b49dcf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHRlbGVjb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
  categorie.add(categorieArticle1);

  Categorie categorieArticle2 = new Categorie();
  categorieArticle2.libelle="interview";
  categorieArticle2.imageUrl="https://plus.unsplash.com/premium_photo-1661270464505-6dc540c51525?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW50ZXJ2aWV3fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60";
  categorie.add(categorieArticle2);

  Categorie categorieArticle3 = new Categorie();
  categorieArticle3.libelle="decryptage";
  categorieArticle3.imageUrl="https://media.istockphoto.com/id/1455333566/fr/photo/informatique-r%C3%A9seau-de-s%C3%A9curit%C3%A9-pare-feu-serveur-internet-cloud-computing.jpg?b=1&s=170667a&w=0&k=20&c=z1SSF0XX6Ld0On4vO0e1_V4CWhF9DoN_Gmf9dfsC8GI=";
  categorie.add(categorieArticle3);

  return categorie;
}