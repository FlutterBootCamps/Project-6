

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';//get
// import 'package:provider_rest_api/models/pets.dart';
// import 'package:http/http.dart' as http;

// class FetchData extends ChangeNotifier {
//   static const apiEndpoint =
//       'https://jatinderji.github.io/users_pets_api/users_pets.json';

 
//   String error = ''; // Variable to hold error message,
//   Pets pets = Pets(data: []); // Instance to hold fetched pets data
//   Pets serachedPets = Pets(data: []); // Instance to hold filtered pets data
//   String searchText = ''; // Text to search for in user names

//   // Method to fetch data from API
//   getDataFromAPI() async {
//     Response response;
//     try {
//       response = await http.get(Uri.parse(apiEndpoint)); 
//       if (response.statusCode == 200) {
//         pets = petsFromJson(response.body); 
//       } else {
//         error = response.statusCode.toString(); // Set error message if status code is not 200
//       }
//     } on FormatException catch (e) {
//       error = 'Format Exception: $e'; // Set error message for format exceptions
//     } catch (e) {
//       error = 'An error occurred: $e'; // Set generic error message for other exceptions
//     }
 
//     updateData(); // Update filtered pets data
//   }

//   // Method to update filtered pets data based on search text
//   updateData() {
//     serachedPets.data.clear(); // Clear previous filtered pets data
//     if (searchText.isEmpty) {
//       serachedPets.data.addAll(pets.data); // Add all pets data if search text is empty
//     } else {
//       serachedPets.data.addAll(pets.data
//           .where((element) =>
//               element.userName.toLowerCase().startsWith(searchText))
//           .toList()); // Add pets whose user names start with the search text
//     }
//     notifyListeners(); // Notify listeners that data has been updated
//   }

//   // Method to perform search based on username
//   search(String username) {
//     searchText = username; // Update search text
//     updateData(); // Update filtered pets data based on new search text
//   }
// }
