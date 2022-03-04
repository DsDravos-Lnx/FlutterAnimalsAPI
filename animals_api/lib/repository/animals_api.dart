import 'dart:async';
import 'package:http/http.dart' as http;

class AnimalsApi {
  static Future getAnimals() {
    Uri url = Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10');
    return http.get(url);
  }
}
