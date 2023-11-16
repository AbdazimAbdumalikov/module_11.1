import 'package:flutter/material.dart';
import 'package:module_11/module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
          crossAxisCount: 3,
        children: azik.map((azik) =>  GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailView(data: azik)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                  tag: azik.id,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(azik.image),
                  ),
              ),
              Hero(
                tag: '${azik.id}-title',
                child: Material(
                  child: Text(azik.description),
                )
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }
}

class DetailView  extends StatelessWidget {
  const DetailView ({super.key, required this.data});
  final Azik data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: data.id,
              child: Image.network(data.image),
            ),
            Hero(
              tag: '${data.id}-title',
              child: Material(
                child: Text(data.description),
              )
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MixinPage(title: 'MixinPage',)),
              );
            },
                child: Text('Mixin Animation Page')
            ),
          ],
        ),
      ),
    );
  }
}

class MixinPage extends StatefulWidget {
  const MixinPage({super.key, required this.title});
  final String title;

  @override
  State<MixinPage> createState() => _MixinPageState();
}

class _MixinPageState extends State<MixinPage>
    with SingleTickerProviderStateMixin {

  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );

    Tween tween = Tween(begin: 0.0, end: 300.0);
    animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: animation.value,
                      child: Icon(
                        Icons.local_police, size: 80
                      )
                  )
                ],
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); 
        },
      ),
    );
  }
}

