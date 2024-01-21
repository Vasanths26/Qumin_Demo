import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../api/fetch_api.dart';
// import 'model/restaurentsmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure initialization here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FetchApi restaurantStore = FetchApi();

  MyApp({super.key}) {
    restaurantStore.fetchRestaurantData();
  } // Create an instance of the MobX store

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('API Data Fetching with MobX'),
          ),
          body: Observer(
            builder: (_) {
              if (restaurantStore.errors != null) {
                // There was an error during data loading
                return Center(
                  child: Text(
                    'Error: ${restaurantStore.errors}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              final restaurents = restaurantStore.menuCategory;

              return ListView.builder(
                itemCount: restaurents.length,
                itemBuilder: (context, index) {
                  final category = restaurents[index];
                  return ListTile(
                    title: Text(category.categoryName.toString()),
                    subtitle:
                        Text('Menu Items Count: ${category.menuItemsCount}'),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
