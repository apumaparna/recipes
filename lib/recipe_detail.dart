import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.label,
          style: const TextStyle(
            backgroundColor: Colors.white30,
            fontFamily: 'Courier New',
            fontWeight: FontWeight.w900,
          ),
        ),
        toolbarHeight: 70.0,
        elevation: 10.0,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          // SizedBox around the image fixes the height of the image,
          // but leaves the width to be adjusted
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.recipe.imageUrl),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(widget.recipe.label,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Courier New',
                  backgroundColor: Colors.black12,
                  fontWeight: FontWeight.w700)),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = widget.recipe.ingredients[index];
                // TODO: Add ingredient.quantity
                return Text(
                    '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
              },
            ),
          ),

          // This is the slider data type
          Slider(
            min: 1,
            max: 10,
            divisions: 9,
            label: '${_sliderVal * widget.recipe.servings} servings',
            value: _sliderVal.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            },
            activeColor: Colors.lime,
            inactiveColor: Colors.deepPurple,
          ),
        ],
      )),
    );
  }
}
