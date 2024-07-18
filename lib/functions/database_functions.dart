import 'package:cloud_firestore/cloud_firestore.dart';

create(String coll, String doc, String name, String animal, int age) async {
  await FirebaseFirestore.instance.collection(coll).doc(doc).set({
    'name': name,
    'animal': animal,
    'age': age,
  });
  print('DB Created');
}

update(String coll, String doc, String field, var fieldVal) async {
  await FirebaseFirestore.instance
      .collection(coll)
      .doc(doc)
      .update({field: fieldVal});
  print('DB Updated');
}

delete(String coll, String doc) async {
  await FirebaseFirestore.instance.collection(coll).doc(doc).delete();
  print('DB deleted');
}
