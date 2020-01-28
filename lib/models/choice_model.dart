class Choice {
  final String name;
  final String imageUrl;
  final String description;
  final String cuisine;
  final int minCalories;
  final int maxCalories;

  Choice(
      {this.name,
      this.description,
      this.imageUrl,
      this.cuisine,
      this.minCalories,
      this.maxCalories});
}

final List<Choice> choices = [
  Choice(
    name: 'Weight Loss',
    description: 'Get on your way to shedding those pounds of extra fat',
    imageUrl: 'assets/ch0.jpg',
    cuisine: 'African, Italian, French',
    minCalories: 0,
    maxCalories: 500,
  ),
  Choice(
      name: 'Muscle Gain',
      description: 'Bulk up and add an extra layer of muscle',
      imageUrl: 'assets/ch1.jpg',
      cuisine: 'African, British, Mediterranean',
      minCalories: 600,
      maxCalories: 800),
  Choice(
      name: 'Maintenance',
      description: 'You\'re alright, just need to shake things up',
      imageUrl: 'assets/ch2.jpg',
      cuisine: 'African, Italian',
      minCalories: 400,
      maxCalories: 600)
];
