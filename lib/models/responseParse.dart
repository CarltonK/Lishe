// To parse this JSON data, do
//
//     final serverResponse = serverResponseFromJson(jsonString);

import 'dart:convert';

ServerResponse serverResponseFromJson(String str) => ServerResponse.fromJson(json.decode(str));

String serverResponseToJson(ServerResponse data) => json.encode(data.toJson());

class ServerResponse {
    List<Result> results;
    int offset;
    int number;
    int totalResults;

    ServerResponse({
        this.results,
        this.offset,
        this.number,
        this.totalResults,
    });

    factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
    };
}

class Result {
    bool vegetarian;
    bool vegan;
    bool glutenFree;
    bool dairyFree;
    bool veryHealthy;
    bool cheap;
    bool veryPopular;
    bool sustainable;
    int weightWatcherSmartPoints;
    String gaps;
    bool lowFodmap;
    bool ketogenic;
    bool whole30;
    String sourceUrl;
    String spoonacularSourceUrl;
    int aggregateLikes;
    int spoonacularScore;
    int healthScore;
    String creditsText;
    String sourceName;
    double pricePerServing;
    int id;
    String title;
    int readyInMinutes;
    int servings;
    String image;
    String imageType;
    List<String> cuisines;
    List<String> dishTypes;
    List<String> diets;
    List<dynamic> occasions;
    WinePairing winePairing;
    List<AnalyzedInstruction> analyzedInstructions;
    List<Nutrition> nutrition;

    Result({
        this.vegetarian,
        this.vegan,
        this.glutenFree,
        this.dairyFree,
        this.veryHealthy,
        this.cheap,
        this.veryPopular,
        this.sustainable,
        this.weightWatcherSmartPoints,
        this.gaps,
        this.lowFodmap,
        this.ketogenic,
        this.whole30,
        this.sourceUrl,
        this.spoonacularSourceUrl,
        this.aggregateLikes,
        this.spoonacularScore,
        this.healthScore,
        this.creditsText,
        this.sourceName,
        this.pricePerServing,
        this.id,
        this.title,
        this.readyInMinutes,
        this.servings,
        this.image,
        this.imageType,
        this.cuisines,
        this.dishTypes,
        this.diets,
        this.occasions,
        this.winePairing,
        this.analyzedInstructions,
        this.nutrition,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        lowFodmap: json["lowFodmap"],
        ketogenic: json["ketogenic"],
        whole30: json["whole30"],
        sourceUrl: json["sourceUrl"],
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        aggregateLikes: json["aggregateLikes"],
        creditsText: json["creditsText"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"].toDouble(),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        image: json["image"],
        imageType: json["imageType"],
        cuisines: List<String>.from(json["cuisines"].map((x) => x)),
        dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
        diets: List<String>.from(json["diets"].map((x) => x)),
        occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
        winePairing: WinePairing.fromJson(json["winePairing"]),
        analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
        nutrition: List<Nutrition>.from(json["nutrition"].map((x) => Nutrition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "lowFodmap": lowFodmap,
        "ketogenic": ketogenic,
        "whole30": whole30,
        "sourceUrl": sourceUrl,
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "aggregateLikes": aggregateLikes,
        "spoonacularScore": spoonacularScore,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "image": image,
        "imageType": imageType,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
        "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
        "diets": List<dynamic>.from(diets.map((x) => x)),
        "occasions": List<dynamic>.from(occasions.map((x) => x)),
        "winePairing": winePairing.toJson(),
        "analyzedInstructions": List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
        "nutrition": List<dynamic>.from(nutrition.map((x) => x.toJson())),
    };
}

class AnalyzedInstruction {
    String name;
    List<Step> steps;

    AnalyzedInstruction({
        this.name,
        this.steps,
    });

    factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
        name: json["name"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
    };
}

class Step {
    int number;
    String step;
    List<Ent> ingredients;
    List<Ent> equipment;
    Length length;

    Step({
        this.number,
        this.step,
        this.ingredients,
        this.equipment,
        this.length,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
        "length": length == null ? null : length.toJson(),
    };
}

class Ent {
    int id;
    String name;
    String image;

    Ent({
        this.id,
        this.name,
        this.image,
    });

    factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

class Length {
    int number;
    String unit;

    Length({
        this.number,
        this.unit,
    });

    factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
    };
}

class Nutrition {
    String title;
    double amount;
    String unit;

    Nutrition({
        this.title,
        this.amount,
        this.unit,
    });

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        title: json["title"],
        amount: json["amount"].toDouble(),
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
        "unit": unit,
    };
}

class WinePairing {
    List<String> pairedWines;
    String pairingText;
    List<ProductMatch> productMatches;

    WinePairing({
        this.pairedWines,
        this.pairingText,
        this.productMatches,
    });

    factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
        pairedWines: List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: List<ProductMatch>.from(json["productMatches"].map((x) => ProductMatch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pairedWines": List<dynamic>.from(pairedWines.map((x) => x)),
        "pairingText": pairingText,
        "productMatches": List<dynamic>.from(productMatches.map((x) => x.toJson())),
    };
}

class ProductMatch {
    int id;
    String title;
    String description;
    String price;
    String imageUrl;
    double averageRating;
    int ratingCount;
    double score;
    String link;

    ProductMatch({
        this.id,
        this.title,
        this.description,
        this.price,
        this.imageUrl,
        this.averageRating,
        this.ratingCount,
        this.score,
        this.link,
    });

    factory ProductMatch.fromJson(Map<String, dynamic> json) => ProductMatch(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        averageRating: json["averageRating"].toDouble(),
        score: json["score"].toDouble(),
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "averageRating": averageRating,
        "ratingCount": ratingCount,
        "score": score,
        "link": link,
    };
}
