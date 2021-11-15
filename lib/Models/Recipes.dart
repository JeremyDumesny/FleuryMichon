import 'package:tinder_clone/Widgets/RecipeCard.dart';

// Create recipes card with the following informations : name, image path, difficulty, quantity, preptime, cooktime

List<RecipeCard> recipes = [
  RecipeCard("Salade de pâtes aux émincés de poulet rôti",
      'assets/images/salade_pates.jpg', "Facile", "4 personnes", 10, 10),
  RecipeCard("Pizza au poulet", 'assets/images/pizza_poulet.jpg', "Facile",
      "4 personnes", 5, 10),
  RecipeCard("Feuilletés au poulet et poireaux",
      'assets/images/feuilletes_poulet.jpg', "Facile", "4 personnes", 30, 15),
  RecipeCard("Tarte au poireaux, ricotta et émincés de poulet",
      'assets/images/tarte_poireaux.jpg', "Facile", "4 à 6 personnes", 15, 45),
  RecipeCard(
      "Tartine de poulet au pesto",
      "assets/images/tartine_poulet_pesto.jpg",
      "Facile",
      "6 personnes",
      15,
      10),
  RecipeCard("RÖSTI DE COURGETTES ÉMINCÉS OU FILET DE POULET ET EMMENTAL",
      "assets/images/rosti.jpg", "Facile", "4 personnes", 15, 20),
  RecipeCard("SALADE AUX ÉMINCÉS DE POULET ET TOMATES CONFITES",
      'assets/images/salade_poulet.png', "Facile", '4 personnes', 15, 10),
  RecipeCard(
      "EMINCÉS DE POULET À LA MOUTARDE",
      'assets/images/emince_poulet_moutarde.jpg',
      "Facile",
      '4 personnes',
      10,
      10),
];
