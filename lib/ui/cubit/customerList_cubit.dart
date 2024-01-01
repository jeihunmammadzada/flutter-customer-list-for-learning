import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers/data/entity/customers.dart';
import 'package:customers/data/repo/customersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListCubit extends Cubit<List<Customers>> {
  CustomerListCubit() : super(<Customers>[]);

  var crepo = CustomersDaoRepository();

  var customerCollection = FirebaseFirestore.instance.collection('Customers');

  Future<void> getCustomers() async {
    customerCollection.snapshots().listen((event) {
      var customerList = <Customers>[];
      var documents = event.docs;

      for (var docs in documents) {
        var key = docs.id;
        var data = docs.data();
        var customer = Customers.fromJson(data, key);

        customerList.add(customer);
      }

      emit(customerList);
    });
  }

  Future<void> search(String word) async {
    customerCollection.snapshots().listen((event) {
      var customerList = <Customers>[];
      var documents = event.docs;

      for (var docs in documents) {
        var key = docs.id;
        var data = docs.data();
        var customer = Customers.fromJson(data, key);

        if(customer.kisi_name.toLowerCase().contains(word.toLowerCase())){
          customerList.add(customer);
        }
      }

      emit(customerList);
    });
  }

  Future<void> remove(String id) async {
    await crepo.remove(id);
  }
}
