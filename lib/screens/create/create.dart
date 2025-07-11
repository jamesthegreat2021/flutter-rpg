import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart'; 

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

  //submitting handler

  void handleSubmit(){
    if(_nameController.text.trim().isEmpty){
      print('Name must not be empty');
      return;
    }
    //trim will remove the white spaces//
    if(_sloganController.text.trim().isEmpty) {
      print('Slogan field must not be empty');
      return;
    }
    print(_nameController.text); 
    print(_sloganController.text);
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
        
              const VocationCard(
                 vocation: Vocation.junkie,
              ),
              const VocationCard(
                vocation: Vocation.ninja,
              ),
              const VocationCard(
                vocation: Vocation.raider,
              ),
              const VocationCard(
                vocation: Vocation.wizard,
              ),
        
        
              StyledButton(
                onPressed: (){}, 
              child: StyledText('Create character')),
            ],
          ),
        ),
      ),
    );
  }
}