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
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: Text(
            widget.recipe.label,
            style: const TextStyle(
              backgroundColor: Colors.white30,
              color: Colors.limeAccent,
              fontFamily: 'Courier New',
              fontWeight: FontWeight.w900,
            ),
          ),
          toolbarHeight: 70.0,
          elevation: 10.0,
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  // SizedBox around the image fixes the height of the image,
                  // but leaves the width to be adjusted
                  SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lime,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.lime, width: 7.0),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage(widget.recipe.imageUrl),
                            )),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.recipe.label,
                      style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Courier New',
                          backgroundColor: Colors.lime,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                      itemCount: widget.recipe.ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ingredient = widget.recipe.ingredients[index];
                        /* multiplies the quantity from the recipe with the number on 
                         * the slider for the total quantity 
                         */
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              '${ingredient.quantity * _sliderVal} '
                              '${ingredient.measure} '
                              '${ingredient.name}',
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Courier New',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ));
                      },
                    ),
                  )),

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
        ));
  }
}
