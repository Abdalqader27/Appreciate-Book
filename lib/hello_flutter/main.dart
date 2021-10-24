import 'package:apprentice_training/hello_flutter/recipe_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/ingredient.dart';
import 'model/recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator ',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.grey,
        secondary: Colors.black,
      )),
      home: MyHomePage(title: "REC App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'assets/1.jpg',
      4,
      [
        Ingredient(1, 'box', 'Spaghetti',),
        Ingredient(4, '', 'Frozen Meatballs',),
        Ingredient(0.5, 'jar', 'sauce',),
      ],
    ),
    Recipe(
      'Tomato Soup',
      'assets/2.jpg',
      2,
      [
        Ingredient(1, 'can', 'Tomato Soup',),
      ],
    ),
    Recipe(
      'Grilled Cheese',
      'assets/3.jpg',
      1,
      [
        Ingredient(2, 'slices', 'Cheese',),
        Ingredient(2, 'slices', 'Bread',),
      ],
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'assets/4.jpg',
      24,
      [
        Ingredient(4, 'cups', 'flour',),
        Ingredient(2, 'cups', 'sugar',),
        Ingredient(0.5, 'cups', 'chocolate chips',),
      ],
    ),
    Recipe(
      'Taco Salad',
      'assets/5.jpg',
      1,
      [
        Ingredient(4, 'oz', 'nachos',),
        Ingredient(3, 'oz', 'taco meat',),
        Ingredient(0.5, 'cup', 'cheese',),
        Ingredient(0.25, 'cup', 'chopped tomatoes',),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: samples.length,
            itemBuilder: (BuildContext context, int index) {
              final recipe = samples[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RecipeDetail(
                        recipe: recipe,
                      );
                    }));
                  },
                  child: buildRecipeCard(recipe));
            }),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
