import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart'; 

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget> [
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor,),

            ),
            Center(
              child: StyledHeading('Welcome, new player'),
            ),
            const Center(
              child: StyledText('Create the name & slogan for your character.'),
            ),
            const SizedBox(
              height: 30,
            ),
             TextField(
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText('Character name'), 
              ),
            ),
            const SizedBox(height: 20,),
           TextField(
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium
              ),
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.chat), 
                label: StyledText('Character slogan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}