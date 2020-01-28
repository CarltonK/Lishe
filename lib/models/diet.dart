class Diet {
  String dietName;
  String dietDescription;
  String dietImage;
  bool selectedItem;

  Diet(
      {this.dietName, this.dietDescription, this.dietImage, this.selectedItem});
}

Diet glutenFree = Diet(
    dietName: 'Gluten Free',
    dietDescription:
        'Eliminating gluten means avoiding wheat, barley, rye, and other gluten-containing grains and foods made from them (or that may have been cross contaminated).',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet ketogenic = Diet(
    dietName: 'Ketogenic',
    dietDescription:
        'The keto diet is based more on the ratio of fat, protein, and carbs in the diet rather than specific ingredients. Generally speaking, high fat, protein-rich foods are acceptable and high carbohydrate foods are not.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet vegeterian = Diet(
    dietName: 'Vegeterian',
    dietDescription:
        'No ingredients may contain meat or meat by-products, such as bones or gelatin.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet lactoVegeterian = Diet(
    dietName: 'Lacto-Vegeterian',
    dietDescription:
        'All ingredients must be vegetarian and none of the ingredients can be or contain egg.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet ovoVegeterian = Diet(
    dietName: 'Ovo-Vegeterian',
    dietDescription:
        'All ingredients must be vegetarian and none of the ingredients can be or contain dairy.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet vegan = Diet(
    dietName: 'Vegan',
    dietDescription:
        'No ingredients may contain meat or meat by-products, such as bones or gelatin, nor may they contain eggs, dairy, or honey.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet pesceterian = Diet(
    dietName: 'Pesceterian',
    dietDescription:
        'Everything is allowed except meat and meat by-products - some pescetarians eat eggs and dairy, some do not.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet paleo = Diet(
    dietName: 'Paleo',
    dietDescription:
        'Allowed ingredients include meat (especially grass fed), fish, eggs, vegetables, some oils (e.g. coconut and olive oil), and in smaller quantities, fruit, nuts, and sweet potatoes. We also allow honey and maple syrup (popular in Paleo desserts, but strict Paleo followers may disagree). Ingredients not allowed include legumes (e.g. beans and lentils), grains, dairy, refined sugar, and processed foods.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet primal = Diet(
    dietName: 'Primal',
    dietDescription:
        'Very similar to Paleo, except dairy is allowed - think raw and full fat milk, butter, ghee, etc.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);

Diet whole30 = Diet(
    dietName: 'Whole30',
    dietDescription:
        'Allowed ingredients include meat, fish/seafood, eggs, vegetables, fresh fruit, coconut oil, olive oil, small amounts of dried fruit and nuts/seeds. Ingredients not allowed include added sweeteners (natural and artificial, except small amounts of fruit juice), dairy (except clarified butter or ghee), alcohol, grains, legumes (except green beans, sugar snap peas, and snow peas), and food additives, such as carrageenan, MSG, and sulfites.',
    dietImage: 'assets/food_two.png',
    selectedItem: false);
