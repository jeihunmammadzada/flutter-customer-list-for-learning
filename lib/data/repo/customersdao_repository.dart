import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers/data/entity/customers.dart';
import 'package:customers/sqlite/database_helper.dart';

class CustomersDaoRepository {

  var customerCollection = FirebaseFirestore.instance.collection('Customers');

  //Save function
  Future<void> Save(String name, String email) async{

    var newCustomer = HashMap<String, dynamic>();
    newCustomer['kisi_id'] = '';
    newCustomer['kisi_name'] = name;
    newCustomer['kisi_email'] = email;
    customerCollection.add(newCustomer);
  }

  Future<void> Update(String id, String name, String email) async{

    var updatedCustomer = HashMap<String, dynamic>();
    updatedCustomer['kisi_id'] = '';
    updatedCustomer['kisi_name'] = name;
    updatedCustomer['kisi_email'] = email;
    customerCollection.doc(id).update(updatedCustomer);
  }

  Future<void> remove(String id) async{
   customerCollection.doc(id).delete();
  }
}