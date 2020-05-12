import 'dart:convert';
import 'package:fitme_diets/models/serverResponse.dart';
import 'package:http/http.dart' as http;

class API {
  //This is a get request
  final String getUrl =
      'https://api.spoonacular.com/recipes/complexSearch?cuisine=African&number=2&apiKey=b2df9097be434f83a75ec6ef7551ea20&addRecipeInformation=true&maxCalories=600&maxAlcohol=0&minProtein=20&maxCarbs=25';

  Future<ServerResponse> getRecipe() async {
    http.Response response = await http.get(getUrl);
    //Check if the response is successfull
    if (response.statusCode == 200) {
      var myResponse = response.body;
      var convertedResponse = serverResponseFromJson(myResponse);
      print(convertedResponse.runtimeType);
      return convertedResponse;
    } else {
      return null;
    }
  }
}
