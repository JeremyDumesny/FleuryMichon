import 'package:flutter/material.dart';
import 'package:fleury_michon/Widgets/RecipeCard.dart';
import 'package:fleury_michon/Models/Ingredients.dart';

// Ingredient formatted like : description, time, seen, istitle, sent, isme, isAddable
class GlobalState with ChangeNotifier {
  List<RecipeCard> recipes = [
    RecipeCard(
      "Salade de pâtes aux émincés de poulet rôti",
      'assets/images/salade_pates.jpg',
      "Facile",
      "4 personnes",
      10,
      10,
      <Ingredients>[
        Ingredients("INGREDIENTS :", "", true, true, true, false, false),
        Ingredients("1 barquette d'émincés de poulet rôti Fleury Michon", "",
            true, true, false, false, true),
        Ingredients("300g de penne", "", true, true, false, false, true),
        Ingredients("1 courgette", "", true, true, false, false, true),
        Ingredients("16 tomates cerises rouges et jaunes", "", true, true,
            false, false, true),
        Ingredients(
            "1 fromage de chèvre frais", "", true, true, false, false, true),
        Ingredients(
            "1 petit oignon nouveau", "", true, true, false, false, true),
        Ingredients(
            "5c à soupe d'huile d'olive", "", true, true, false, false, true),
        Ingredients("2c à soupe de vinaigre balsamique blanc", "", true, true,
            false, false, true),
        Ingredients(
            "1 petit bouquet de basilic", "", true, true, false, false, true),
        Ingredients(
            "Sel & Poivre du moulin", "", true, true, false, false, true),
        Ingredients("PREPARATION :", "", true, true, true, true, false),
        Ingredients(
            "1) Faites cuire les pâtes 10 min dans une casserole d’eau bouillante salée",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients(
            "2. Lavez soigneusement la courgette puis détaillez-la en fines lanières avec un couteau (à l'économe ou au couteau, selon vos préférences).",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients(
            "3) Coupez les tomates cerise en 2 et le chèvre frais en dés.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients(
            "4) Préparez la vinaigrette en émulsionnant l’huile d’olive, le vinaigre, le sel et le poivre du moulin.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients(
            "5) Mélangez délicatement tous les ingrédients dans un saladier.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients(
            "6. Ajoutez les émincés de poulet Fleury Michon, le basilic et la vinaigrette.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients("Bon appétit !", "", true, false, true, true, false),
      ],
    ),
    RecipeCard(
      "Pizza au poulet",
      'assets/images/pizza_poulet.jpg',
      "Facile",
      "4 personnes",
      5,
      10,
      <Ingredients>[
        Ingredients("INGREDIENTS :", "", true, true, false, false, false),
        Ingredients("150g d'aiguillettes de poulet rôti Fleury Michon", "",
            true, true, false, false, true),
        Ingredients("1 pâte à pizza", "", true, true, false, false, true),
        Ingredients(
            "1 boule de mozzarella", "", true, true, false, false, true),
        Ingredients("50g de gruyère râpé", "", true, true, false, false, true),
        Ingredients(
            "20cl de crème fraîche", "", true, true, false, false, true),
        Ingredients("PREPARATION :", "", true, true, false, true, false),
        Ingredients("1) Posez la pâte à pizza sur votre plaque.", "", true,
            false, true, true, false),
        Ingredients(
            "2) Etalez dessus la crème fraîche (sans en mettre partout !), la mozzarella préalablement coupée en rondelles, puis les aiguilettes tranchées de poulet grillé.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients("3) Parsemez le tout de gruyère.", "", true, false, false,
            true, false),
        Ingredients(
            "4) Mettez au four à 180°C jusqu'à ce que la croûte soit bien dorée.",
            "",
            true,
            false,
            false,
            true,
            false),
        Ingredients("Bon appétit !", "", true, false, false, true, false),
      ],
    ),
    RecipeCard(
        "Feuilletés au poulet et poireaux",
        'assets/images/feuilletes_poulet.jpg',
        "Facile",
        "4 personnes",
        30,
        15, <Ingredients>[
      Ingredients("INGREDIENTS :", "", true, true, false, false, false),
      Ingredients("150g d'aiguillettes de poulet rôti Fleury Michon", "", true,
          true, false, false, true),
      Ingredients("25g de beurre", "", true, true, false, false, true),
      Ingredients("1 blanc de poireau", "", true, true, false, false, true),
      Ingredients("2 oignons", "", true, true, false, false, true),
      Ingredients("5 feuilles de brick", "", true, true, false, false, true),
      Ingredients("3cl de crème liquide", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients(
          "1) Faites fondre dans une sauteuse le beurre et y ajoutez le poireau et les oignons émincés.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "2) Quand le tout est fondant, ajoutez 150ml d'eau bouillante et le cube de bouillon. Laisser mijoter jusqu'à ce que le liquide soit absorbé.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "3) Préchauffez le four à 180°C. Ajoutez la crème liquide et les émincés de poulet Fleury Michon (cela marche aussi avec des dés de jambon cuits) et laissez refroidir ce mélange.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "4) Coupez les feuilles de brick en 2 puis les plier dans la longueur.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "5) Déposez une cuillère à soupe de farce et pliez en rectangle. Mettez-les sur une plaque couverte de papier sulfurisé et mettre au four 10 à 15 min.(sans vous brûler)",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients("Bon appétit !", "", true, false, false, true, false),
    ]),
    RecipeCard(
        "Tarte aux poireaux, ricotta et émincés de poulet",
        'assets/images/tarte_poireaux.jpg',
        "Facile",
        "4 à 6 personnes",
        15,
        45, <Ingredients>[
      Ingredients("INGREDIENTS :", "", true, true, false, false, false),
      Ingredients("150g d'émincés de poulet Fleury Michon", "", true, true,
          false, false, true),
      Ingredients(
          "1 pâte feuilletée à dérouler", "", true, true, false, false, true),
      Ingredients("3 poireaux", "", true, true, false, false, true),
      Ingredients("400g de ricotta", "", true, true, false, false, true),
      Ingredients("3 œufs", "", true, true, false, false, true),
      Ingredients(
          "3c à soupe d'huile d'olive", "", true, true, false, false, true),
      Ingredients("2c à soupe de vinaigre balsamique blanc", "", true, true,
          false, false, true),
      Ingredients("1 pincée de muscade", "", true, true, false, false, true),
      Ingredients("Sel & Poivre du moulin", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients(
          "1) Préchauffez le four à 180°C. Pendant que le four préchauffe, lavez et émincez finement les poireaux dans une poêle avec l'huile d'olive. Salez, poivrez et laissez cuire  15 min à feu doux. Déroulez la pâte feuilletée dans un plat à tarte et piquez-la avec une fourchette.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "2) Cassez les oeufs (avec amour) et battez-les en omelette dans un saladier. Ajoutez la ricotta, mélangez puis incorporez la moitié des poireaux et des émincés de poulet.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "3) Assaisonnez et ajoutez une pointe de muscade. Versez cette préparation sur le fond de tarte puis ajoutez le restant des poireaux et des émincés de poulet.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients("4) Enfournez et laissez cuire 30 min à 180°C.", "", true,
          false, false, true, false),
      Ingredients("5) Servez avec une petite salade (c’est toujours meilleur).",
          "", true, false, false, true, false),
      Ingredients("Bon appétit !", "", true, false, false, true, false),
    ]),
    RecipeCard(
        "Tartine de poulet au pesto",
        "assets/images/tartine_poulet_pesto.jpg",
        "Facile",
        "6 personnes",
        15,
        10, <Ingredients>[
      Ingredients("INGREDIENTS :", "", true, true, false, false, false),
      Ingredients("150g d'émincés de poulet Fleury Michon", "", true, true,
          false, false, true),
      Ingredients("1 poivron jaune", "", true, true, false, false, true),
      Ingredients("6 Tranches de pain", "", true, true, false, false, true),
      Ingredients("1 botte de basilic", "", true, true, false, false, true),
      Ingredients("50 g de pignons de pin", "", true, true, false, false, true),
      Ingredients("50 g de parmesan", "", true, true, false, false, true),
      Ingredients("80ml d'huile d'olive", "", true, true, false, false, true),
      Ingredients("Sel & Poivre du moulin", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients(
          "1) Toaster les tranches de pain au four à 200°C pendant quelques minutes.",
          "",
          true,
          false,
          true,
          true,
          false),
      Ingredients(
          "2) Piler de manière régulière l'ail avec les pignons de pin et les feuilles de basilic (réserver quelques jolies feuilles pour la présentation).",
          "",
          true,
          false,
          true,
          true,
          false),
      Ingredients(
          "3) Après quelques minutes, ajouter le parmesan à cette pâte assez grossière. Ajouter l'huile d'olive et mélanger. Tartiner les tranches de pain avec le pesto.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "4) Disposer joliment les morceaux de poulet sur le pesto et décorer de quelques feuilles de basilic entières & de poivrons coupés.",
          "",
          true,
          false,
          true,
          true,
          false),
      Ingredients("Bon appétit !", "", true, false, true, true, false),
    ]),
    RecipeCard(
        "Rösti de courgettes émincés ou filet de poulet et emmental",
        "assets/images/rosti.jpg",
        "Facile",
        "4 personnes",
        15,
        20, <Ingredients>[
      Ingredients("INGREDIENTS :", "", true, true, false, false, false),
      Ingredients("75 g émincés ou filet de poulet Fleury Michon", "", true,
          true, false, false, true),
      Ingredients(
          "75 g d'emmental en cube", "", true, true, false, false, true),
      Ingredients("2 courgettes", "", true, true, false, false, true),
      Ingredients("2 grosses pommes de terre à purée", "", true, true, false,
          false, true),
      Ingredients("1 œuf", "", true, true, false, false, true),
      Ingredients("2c à soupe de fécule de pommes de terre", "", true, true,
          false, false, true),
      Ingredients(
          "4c à soupe d’huile d’olive", "", true, true, false, false, true),
      Ingredients("Sel & Poivre du moulin", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients(
          "1) Commencez par préchauffer votre four à 180°C.7) Et pour rendre le tout encore plus gourmand, servez bien chaud avec une délicieuse salade verte !",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "2) Faites cuire les pommes de terre 10 minutes dans une casserole d’eau bouillante salée, puis retirez la peau (sans vous brûler !) et râpez-les grossièrement.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "3) Lavez les courgettes, séchez-les et râpez-les en gardant la peau !",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "4) Faites un joli mélange des courgettes avec un œuf battu et ajoutez les râpés de pommes de terre. Mélangez, salez et poivrez.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "5) Place aux émincés de poulet et aux dés d’emmental ! Vous n’avez pas d’émincés ? Pas de problème, des filets de poulet feront parfaitement l’affaire ! Ajoutez-les à la préparation et formez de jolies galettes de 10cm sur 2cm d’épaisseur.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "6) Déposez-les sur une plaque de cuisson recouverte de papier sulfurisé et hop, au four 15 à 20 minutes.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "7) Et pour rendre le tout encore plus gourmand, servez bien chaud avec une délicieuse salade verte !",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients("Bon appétit !", "", true, false, false, true, false),
    ]),
    RecipeCard(
        "Salade aux émincés de poulet et tomates confites",
        'assets/images/salade_poulet.png',
        "Facile",
        '4 personnes',
        15,
        10, <Ingredients>[
      Ingredients("INGREDIENTS :", "", true, true, false, false, false),
      Ingredients("150g d’émincés de poulet rôti Fleury Michon", "", true, true,
          false, false, true),
      Ingredients(
          "280g de tomates séchées", "", true, true, false, false, true),
      Ingredients("150g de comté", "", true, true, false, false, true),
      Ingredients("1 gros oignon", "", true, true, false, false, true),
      Ingredients("Croûtons chauds", "", true, true, false, false, true),
      Ingredients("Vinaigre", "", true, true, false, false, true),
      Ingredients("Echalote ciselée", "", true, true, false, false, true),
      Ingredients("Ciboulette", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients(
          "1) Sur un doux et moelleux lit de salade, disposez quelques tomates séchées, des dés ou des copeaux de comté.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "2) Emincez l’oignon et faites-le revenir dans une poêle, avec les croûtons.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "3) Ajoutez les morceaux d'oignon frits, les croûtons et 150g d'émincés de poulet rôti Fleury Michon.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "4) Versez la vinaigrette en y incorporant une petite échalote finalement ciselée, et une pointe de moutarde.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "P'tite astuce du chef : quelques brins de ciboulette dans la recette, et votre plat aura encore plus de goût !",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients("Bon appétit !", "", true, false, false, true, false),
    ]),
    RecipeCard(
        "Emincés de poulet à la moutarde",
        'assets/images/emince_poulet_moutarde.jpg',
        "Facile",
        '4 personnes',
        10,
        10, <Ingredients>[
      Ingredients("INGREDIENTS:", "", true, true, false, false, false),
      Ingredients("1 barquette d'Emincés de poulet Fleury Michon", "", true,
          true, false, false, true),
      Ingredients("2 verres de riz", "", true, true, false, false, true),
      Ingredients("2 oignons moyens", "", true, true, false, false, true),
      Ingredients("Huile d'olive", "", true, true, false, false, true),
      Ingredients(
          "1 cuillère à soupe de moutarde", "", true, true, false, false, true),
      Ingredients("20 cl de crème fraîche", "", true, true, false, false, true),
      Ingredients(
          "1 petite boite de champignons", "", true, true, false, false, true),
      Ingredients("PREPARATION :", "", true, true, true, true, false),
      Ingredients("1) Faites cuire 2 verres de riz (pas plus, pas moins !).",
          "", true, false, false, true, false),
      Ingredients(
          "2) Préparez la sauce moutarde en coupant 2 oignons moyens en lamelles et les faire revenir dans de l'huile d'olive.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "3) Lorsque les oignons ont une jolie couleur dorée, ajouter 1 cuillère à soupe de moutarde, 20 cl de crème fraîche et 1 petite boite de champignons.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients(
          "4) Laissez cuire pendant 3 minutes et ajouter 1 barquette d'émincés de poulet.",
          "",
          true,
          false,
          false,
          true,
          false),
      Ingredients("Bon appétit !", "", true, false, false, true, false),
    ]),
  ];

  List<Ingredients> listecourse = List.empty(growable: true);
  List<Ingredients> validatedListCourse = List.empty(growable: true);
  List<RecipeCard> likedRecipes = List.empty(growable: true);

  List<Ingredients> promotions = [
    Ingredients("Offre 24h, -50% sur le troisième produit Fleury Michon acheté",
        "", false, false, false, false, true),
    Ingredients(
        "1 paquet de jambon Fleury Michon acheté = le deuxième à moins 20%",
        "",
        false,
        false,
        false,
        false,
        true),
  ];

  int index;
  String fleuryBarCode = "";
  bool hasScanned = false;

  GlobalState(BuildContext context) {
    notifyListeners();
  }

  Future<void> resetIndex() async {
    index = 0;
    notifyListeners();
  }

  Future<void> incrementIndex() async {
    index += 1;
    notifyListeners();
  }

  Future<void> resetLikedList() async {
    likedRecipes.clear();
    notifyListeners();
  }

  Future<void> resetBasket() async {
    listecourse.clear();
    notifyListeners();
  }

  Future<void> resetValidatedBasket() async {
    validatedListCourse.clear();
    notifyListeners();
  }

  Future<void> substractValidatedToBaseList() async {
    validatedListCourse.forEach((element) { 
      if (listecourse.contains(element)) {
        listecourse.remove(element);
      }
    });
    notifyListeners();
  }

  Future<void> addIngredient(Ingredients ingredient) async {
    listecourse = [...listecourse, ingredient];
    notifyListeners();
  }

  Future<void> validatedIngredient(Ingredients ingredient) async {
    if (validatedListCourse.contains(ingredient)) {
      removeFromValidBasket(ingredient);
    } else {
      validatedListCourse = [...validatedListCourse, ingredient];
    }
    notifyListeners();
  }

  bool isIngredientInValidBasket(Ingredients ingredient) {
    return validatedListCourse.contains(ingredient);
  }

  bool isIngredientInBasket(Ingredients ingredient) {
    return listecourse.contains(ingredient);
  }

  Future<void> removeFromBasket(Ingredients ingredient) async {
    if (listecourse.contains(ingredient)) {
      listecourse.remove(ingredient);
    }
    notifyListeners();
  }

  Future<void> removeFromValidBasket(Ingredients ingredient) async {
    if (validatedListCourse.contains(ingredient)) {
      validatedListCourse.remove(ingredient);
    }
    notifyListeners();
  }

  bool isBasketEmpty() {
    return listecourse.isEmpty;
  }

  Future<void> likeRecipe(RecipeCard card) async {
    likedRecipes = [...likedRecipes, card];
    await incrementIndex();
    notifyListeners();
  }

  String returnBarcodeValue(String value) {
    if (value == "-1") {
      fleuryBarCode = "Scan annulé";
      hasScanned = false;
      notifyListeners();
    } else if (value == "3095758913013") {
      fleuryBarCode = "FLEURY MICHON EMINCES DE POULET ROTI";
      hasScanned = true;
      notifyListeners();
    } else {
      fleuryBarCode = value;
      hasScanned = false;
      notifyListeners();
    }

    return fleuryBarCode;
  }
}
