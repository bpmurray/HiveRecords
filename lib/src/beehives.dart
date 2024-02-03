import 'package:flutter/material.dart';
import 'hivedata.dart';

class BeehiveApp extends StatelessWidget {
  const BeehiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beehive Inspection App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ApiaryList(),
    );
  }
}

class ApiaryList extends StatelessWidget {
  final List<Apiary> apiaries = [
    // Add your apiaries here
  ];

  ApiaryList({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apiaries'),
      ),
      body: ListView.builder(
        itemCount: apiaries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(apiaries[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HiveList(apiary: apiaries[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class HiveList extends StatelessWidget {
  final Apiary apiary;

  const HiveList({super.key, required this.apiary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${apiary.name} Hives'),
      ),
      body: ListView.builder(
        itemCount: apiary.hives.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Hive no. ${apiary.hives[index].hiveID}),
            // Add more details about each hive here
          );
        },
      ),
    );
  }
}
