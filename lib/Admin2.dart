import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin2 extends StatefulWidget {
  @override
  _Admin2State createState() => _Admin2State();
}

class _Admin2State extends State<Admin2> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats'),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            Text(
              'Shark-Net',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontFamily: 'YourFontFamily',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'By Hani Berriche',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'YourSubtitleFontFamily',
                fontWeight: FontWeight.normal,
              ),
            ),

            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true, // Allow the ListView to take only the space it needs
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var document = documents[index];
                    var number = document['number'];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          FirebaseFirestore.instance.collection('users').doc(document.id).delete();
                        },
                        background: Container(
                          color: Colors.black,
                          child: Icon(Icons.delete, color: Colors.white),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 16.0),
                        ),
                        child: ListTile(
                          tileColor: Color(0xFFE85852),
                          contentPadding: EdgeInsets.all(4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.favorite, color: Color(0xFFE85852)),
                          ),
                          title: Text(
                            'Number: $number',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Click to see Détails",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(document: document),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot document;

  DetailsPage({required this.document});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Copyright : Hani Berriche'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var entry in data.entries)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    text: '${entry.key}: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${entry.value}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


          ],
        ),
      ),
    );
  }
}
