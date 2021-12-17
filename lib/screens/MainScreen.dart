import 'package:flutter/material.dart';
import 'package:flutter_tp6/models/product.dart';
import 'package:flutter_tp6/services/firestore_db_service.dart';
import 'package:flutter_tp6/widgets/product_dialog.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore Products Manager"),
      ),
      // -- Using a stream builder will update the UI
      // -- in real-time whenever data is changed in firebase
      body: StreamBuilder(
        stream: FireStoreDbService.products$,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          /*  if (snapshot.hasData) {
            return ProductsList(
              products: snapshot.data,
            );
          } else */
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const ProductDialog(),
          );
        },
      ),
    );
  }
}
