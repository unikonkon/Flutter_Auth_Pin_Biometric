// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late List _cryptoList;
//   @override
//   Widget build(BuildContext context) {
//     Future getCryptoPrices() async {
      
//       //async to use await, which suspends the current function, while it does other stuff and resumes when data ready
//       print('getting crypto prices'); //print
//       String _apiURL =
//           "https://api.coinmarketcap.com/v1/ticker/"; //url to get data
//       http.Response response = await http.get(Uri.parse.(_apiURL)); //waits for response
//       setState(() {
//         this._cryptoList =
//             jsonDecode(response.body); //sets the state of our widget
//         print(_cryptoList); //prints the list
//       });
//       return;
//     }

//     return Container();
//   }
// }
