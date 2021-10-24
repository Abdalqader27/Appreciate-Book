import 'ingredient.dart';

class Recipe {
  final String label;
  final String imageUrl;
 final int servings;
  final List<Ingredient> ingredients;
    Recipe(this.label, this.imageUrl, this.servings, this.ingredients);
}
