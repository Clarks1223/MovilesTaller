import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firestore Demo'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('lugares').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error al cargar los datos');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              String imageUrl = data['Foto'];

              return ListTile(
                title: Text(data['Nombre']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ubicación: ${data['Ubicacion']}'),
                    Image.network(
                      imageUrl,
                      width: 300,
                      height: 300,
                    ),
                    Text('Descripción: ${data['Descripcion']}'),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}