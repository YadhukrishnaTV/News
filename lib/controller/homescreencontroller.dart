import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/model.dart';


class Homescreen_provider with ChangeNotifier {
  bool is_loading = false;
  bool iscategoryloading = false;
  PubilcApi? datamodel;

  Fetchnews({String searchQuery = "trending"}) async {
    is_loading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decodedData = jsonDecode(response.body);

    datamodel = PubilcApi.fromJson(decodedData);
    is_loading = false;
    notifyListeners();
  }

  fetchCategorySports( {String category = "sports",String category1 = "health"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

  //health
  fetchCategoryHealth({String category = "Health"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//technology
  fetchCategoryTechnology({String category = "Technology"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//business
  fetchCategoryBussines({String category = "Bussiness"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//science
   fetchCategoryScience({String category = "Science"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//general
  fetchCategoryGeneral({String category = "General"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=5d854d1f2d8645d29659712ebc13bde9");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = PubilcApi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }
}