class DietModel {
  String titleDiet;
  String descriptionDiet;

  DietModel({this.titleDiet, this.descriptionDiet});
}

List<DietModel> diets = [
  DietModel(
      titleDiet: 'Gluten Free',
      descriptionDiet:
          'Eliminating gluten means avoiding wheat, barley, rye, and other gluten-containing grains and foods made from them (or that may have been cross contaminated).'),
  DietModel(
      titleDiet: 'Ketogenic',
      descriptionDiet:
          'The keto diet is based more on the ratio of fat, protein, and carbs in the diet rather than specific ingredients. Generally speaking, high fat, protein-rich foods are acceptable and high carbohydrate foods are not.'),
  DietModel(
    titleDiet: 'Vegetarian',
    descriptionDiet:
        'No ingredients may contain meat or meat by-products, such as bones or gelatin.',
  ),
  DietModel(
      titleDiet: 'Lacto-Vegetarian',
      descriptionDiet:
          'All ingredients must be vegetarian and none of the ingredients can be or contain egg.'),
  DietModel(
      titleDiet: 'Ovo-Vegetarian',
      descriptionDiet:
          'All ingredients must be vegetarian and none of the ingredients can be or contain dairy.'),
  DietModel(
      titleDiet: 'Vegan',
      descriptionDiet:
          'No ingredients may contain meat or meat by-products, such as bones or gelatin, nor may they contain eggs, dairy, or honey.'),
];
