import 'package:customers/data/entity/customers.dart';
import 'package:customers/data/repo/customersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCustomerCubit extends Cubit<void>{
  AddCustomerCubit():super(0);

  var crepo = CustomersDaoRepository();

  //Save function
  Future<void> Save(String name, String email) async{
      await crepo.Save(name, email);
  }
}