import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({
    required this.character,
    super.key
    });

    final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}', 
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(width: 20), 
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title), 
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor,),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const StyledHeading("Slogan"), 
                    StyledText(character.slogan), 
                    const SizedBox(height: 10,), 

                    const StyledHeading("Weapon of Choice"), 
                    StyledText(character.vocation.weapon), 
                    const SizedBox(height: 10,), 

                    const StyledHeading("Unique ability"), 
                    StyledText(character.vocation.ability), 
                    const SizedBox(height: 10,), 
                    
                    
                  ],
                )
              ),
            ), 

          ],
        ),
      ),
    );
  }
}