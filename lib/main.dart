import 'package:flutter/material.dart';
import 'package:hydrology_modular_way/api/services/api_service.dart';

import 'api/services/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String _accessToken = '';
  String _gmail = '';
  dynamic _ffwcData = '';


  void _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken('01767009920@ffwcsms', 'leodev#2023');
    dynamic data = await apiService.getEndpointData(accessToken: accessToken, endpoint: Endpoint.getFFWC);
    // final gmail = await apiService.getEndpointData(accessToken: accessToken);
    setState(() {
      _accessToken = accessToken;
      _ffwcData = data;
      // _gmail = gmail;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _accessToken,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Text(
              _ffwcData,
              style: Theme.of(context).textTheme.displayMedium,
            ),


            // Text(
            //   _gmail,
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
