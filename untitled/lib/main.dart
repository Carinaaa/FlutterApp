import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Workouts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
              'https://source.unsplash.com/random?monochromatic+dark',
              fit: BoxFit.cover,
              ),
              title: Text(_title),
              centerTitle: true,
            ),
            leading: const Icon(Icons.arrow_back),
            actions: const [
              Icon(Icons.settings),
              SizedBox(width: 12),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return Container(
                  color: Colors.orange[100 * (index % 9)],
                  child: Card(
                    child: Image.network(
                      'https://source.unsplash.com/random?sig=$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: 50,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.5,
            ),
          ),
        ],
      ),),

    );
  }
}
