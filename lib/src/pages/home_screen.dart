import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String imageUrl = data['Foto'];

              return ListTile(
                title: Text(data['Nombre']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ubicación: ${data['Ubicacion']}'),
                    FutureBuilder(
                      future: _getImageUrl(imageUrl),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error al cargar la imagen');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return Text('No se pudo obtener la imagen');
                        } else {
                          String imageUrl = snapshot.data as String;
                          return Image.network(
                            imageUrl,
                            width: 100,
                            height: 100,
                          );
                        }
                      },
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

  Future<String> _getImageUrl(String imagePath) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref().child(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error al obtener la URL de la imagen: $e');
      return '';
    }
  }
}
