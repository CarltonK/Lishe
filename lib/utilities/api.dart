import 'package:fitme_diets/models/responseParse.dart';
import 'package:http/http.dart' as http;

class API {
  var weightLossUrl = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=b2df9097be434f83a75ec6ef7551ea20&addRecipeInformation=true&maxCalories=500&maxAlcohol=0&minProtein=30&maxCarbs=25&instructionsRequired=true&number=3';
  Future<ServerResponse> getWeightLossDiet() async {
    try {
      final response = await http.get(weightLossUrl);

      if (response.statusCode == 200) {

        var results = response.body;
        //Convert results to PODO
        final serverResponse = serverResponseFromJson(results);
        return serverResponse;

      }
      else {
        throw Exception('Failed to load');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
}