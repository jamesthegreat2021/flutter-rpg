import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create_screen.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


//recall that this runs before the build function
  @override
  void initState() {
   Provider.of<CharacterStore>(context, listen: false)
   .fetchCharactersOnce();
    super.initState();
  }

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
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index){
                      return Dismissible(
                        key: ValueKey(value.characters[index].id),
                        onDismissed: (direction) {
                          
                          Provider.of<CharacterStore>(context, listen: false)
                          .removeCharacter(value.characters[index]); 
                        },
                        child: CharacterCard(
                         value.characters[index]
                        ),
                      ); 
                    },
                  
                  );
                }
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const CreateScreen(),
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