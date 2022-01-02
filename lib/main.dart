import 'recipe.dart';
import 'recipe_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.black45, secondary: Colors.deepPurple)),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            backgroundColor: Colors.white30,
            fontFamily: 'Courier New',
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            fontSize: 25.0,
          ),
        ),
        toolbarHeight: 70.0,
        elevation: 10.0,
      ),
      body: SafeArea(
          // Having a SafeArea prevents the app contents from
          // encroaching on operating system interfaces
          child: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return RecipeDetail(recipe: Recipe.samples[index]);
                  },
                ));
              },
              child: buildRecipeCard(Recipe.samples[index]));
        },
      )),
    );
  }

  // Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
        // elevation adds shadow
        elevation: 2.0,
        color: Colors.black12,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                  backgroundColor: Colors.black38,
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Courier New'),
            ),
          ]),
        ));
  }
}
