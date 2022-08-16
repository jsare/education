import 'package:app_http/offices.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<OfficesList> officesList;

  @override
  void initState() {
    super.initState();
    officesList = getOfficesList();
    // loadData(); // Урок 54.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking'),
        centerTitle: true,
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.offices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data?.offices[index].name}'),
                    subtitle: Text('${snapshot.data?.offices[index].address}'),
                    leading:
                        Image.network('${snapshot.data?.offices[index].image}'),
                    isThreeLine: true,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// Урок 54.
// Future<http.Response> getData() async {
//   final url = Uri.parse('https://about.google/static/data/locations.json');
//   return await http.get(url);
// }

// void loadData() {
//   getData()
//       .then((response) => response.statusCode == 200
//           ? print(response.body)
//           : print(response.statusCode))
//       .catchError((error) => debugPrint(error.toString()));
// }
