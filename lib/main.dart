import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async { 
  //this makes the firebase to work correctly
  WidgetsFlutterBinding.ensureInitialized(); 

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
     ChangeNotifierProvider(
      create: (context) {
        return CharacterStore();
      },
       child: MaterialApp(
        theme: primaryTheme,
         home: const Home(),),
     ), 
     // home: const Create(),),
  );
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('Sandbox'),
    );
  }
}