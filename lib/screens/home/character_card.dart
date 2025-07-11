import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/profile/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {


  const CharacterCard(
    this.character,
    {super.key}
    );

    final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget> [
            Image.asset('assets/img/vocations/${character.vocation.image}', width: 80 ,),

            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),

            Expanded(
              child: const SizedBox(),
            ), 
            
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const Profile(),
                ));
              }, 
              icon: Icon(
                color: AppColors.textColor,
                Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}