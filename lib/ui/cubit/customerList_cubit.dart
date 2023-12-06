import 'package:customers/data/entity/customers.dart';
import 'package:customers/data/repo/customersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListCubit extends Cubit<List<Customers>>{
    CustomerListCubit():super(<Customers>[]);

    var crepo = CustomersDaoRepository();


    Future<void> getCustomers() async {
      var list = await crepo.getCustomers();
      emit(list);
    }

    Future<void> search(String word) async {
      var list = await crepo.search(word);
      emit(list);
    }

    Future<void> remove(int id) async{
      await crepo.remove(id);
      await getCustomers();
    }
}