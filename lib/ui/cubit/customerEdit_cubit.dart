import 'package:customers/data/entity/customers.dart';
import 'package:customers/data/repo/customersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerEditCubit extends Cubit<void>{
  CustomerEditCubit():super(0);

  var crepo = CustomersDaoRepository();

  Future<void> Update(String id, String name, String email) async{
      await crepo.Update(id, name, email);
  }

}