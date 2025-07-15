//changenotifiers will actuall notify all the listeners indeed
import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/services/firestore_service.dart'; 

class CharacterStore extends ChangeNotifier{

  final List<Character> _characters = [];

  get characters => _characters;

  void addCharacter(Character character){
    //call the addcharacter method at here
    FirestoreService.addCharacter(character);
    //notify all the consumers in case of any of the changes
    _characters.add(character);
    notifyListeners();
  }

    Future<void> saveCharacter(character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  void fetchCharactersOnce() async {
    if (characters.length == 0){
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs){
           _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}