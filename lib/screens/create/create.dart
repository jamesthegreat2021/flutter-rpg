import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:uuid/uuid.dart';

var uuid = const Uuid(); 

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController(); 

  @override
  void dispose(){
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //handling vocations selection
  Vocation selectedVocaton = Vocation.junkie;


//this is tricky but understandable
  void updateVocation(Vocation vocation){
   setState(() {
     selectedVocaton = vocation;
   });
  }

  //submitting handler

  void handleSubmit(){
    
    if(_nameController.text.trim().isEmpty){
      //show error dialogue
      showDialog(context: context, builder: (ctx){
        //flutter treats the dialogue just like a route, so if we need to return we will need the navigator.pop
        return AlertDialog(
         
          title: StyledHeading('Missing character name'),
          content: StyledText('Every good RPG character needs a great name.....'),
          actions: [
            StyledButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child: const StyledHeading('Close'),
              ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    //trim will remove the white spaces//
    if(_sloganController.text.trim().isEmpty) {
      //show error dialogue

       showDialog(context: context, builder: (ctx){
        //flutter treats the dialogue just like a route, so if we need to return we will need the navigator.pop
        return AlertDialog(
          
          title: StyledHeading('Missing character slogun'),
          content: StyledText('Remember to add a catch slogan.....'),
          actions: [
            StyledButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child: const StyledHeading('Close'),
              ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    characters.add(
      Character(
        name: _nameController.text.trim(), 
        slogan: _sloganController.text.trim(), 
        id: uuid.v4(), 
        vocation: selectedVocaton
        )
    );

    Navigator.push(context, MaterialPageRoute(

      builder: (ctx) => const Home(),

      )); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                controller: _nameController,
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
              controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat), 
                  label: StyledText('Character slogan'),
                ),
              ),
              const SizedBox(height: 30),
        
               Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
        
              ),
              Center(
                child: StyledHeading('Choose a vocation'),
              ),
              const Center(
                child: StyledText('This determines your available skills'),
              ),
              const SizedBox(height: 30,),

        //remember the function will only be the property of the object 
        //whenever the user does taps it will be automatically invoked triggering the widget build

            VocationCard(
              //these are constants instances, they will have to be the same
              selected: selectedVocaton == Vocation.junkie,
                onTap: updateVocation,
                 vocation: Vocation.junkie,
              ),
            VocationCard(
              selected: selectedVocaton == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocaton == Vocation.raider, 
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
           VocationCard(
            selected: selectedVocaton == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),
              const SizedBox(
                height: 30,),

              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
        
              ),
              Center(
                child: StyledHeading('Good Luck'),
              ),
              const Center(
                child: StyledText('And enjoy the journey........'),
              ),
              const SizedBox(
                height: 30,),
        
        
              StyledButton(
                onPressed: handleSubmit, 
              child: StyledText('Create character')),
            ],
          ),
        ),
      ),
    );
  }
}