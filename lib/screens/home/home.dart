import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 //update the list to characters

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget> [
             //a callback function is the function that is passed as an argument to another function

            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index){
                  return CharacterCard(
                    characters[index]
                  ); 
                },
              
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const Create(),
                  ));
              }, 
              child: StyledHeading('create new'),
              )
          ],
        ),
      ),
    );
  }
}