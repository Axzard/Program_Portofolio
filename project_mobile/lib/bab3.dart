import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implementasi UI'),
      ),
      body: ContentWidget(),
    );
  }
}
class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Bagian Flutter Logo dan Text
          Center(
            child: Column(
              children: [
                FlutterLogo(size: 100),
                Text(
                  'Selamat Datang di Flutter',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          // Bagian Tombol
          ElevatedButton(
            onPressed: () {},
            child: Text('Klik Saya'),
          ),
          
          SizedBox(height: 20),
          
          // Bagian GridView
          Container(
            height: 300,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return CustomGridItem();
              },
            ),
          ),
          
          // Bagian ListView
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomListItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
class CustomGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.image, color: Colors.white, size: 50),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final int index;

  CustomListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('Item $index'),
      subtitle: Text('Subtitle $index'),
    );
  }
}
