import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //the static method because it can be accessed directly without instantiating the class

  //static lasses and methods arent accessed from the class itself instead they are accessed from the instances

  static final ref = FirebaseFirestore.instance.collection('characters');



}