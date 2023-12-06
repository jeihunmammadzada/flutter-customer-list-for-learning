import 'package:customers/data/entity/customers.dart';
import 'package:customers/sqlite/database_helper.dart';

class CustomersDaoRepository {

  //Save function
  Future<void> Save(String name, String email) async{

    var db = await DatabaseHelper.connectDatabase();

    var newCustomer = Map<String, dynamic>();
    newCustomer["name"] = name;
    newCustomer["email"] = email;

    await db.insert('customers', newCustomer);

  }

  Future<void> Update(int id, String name, String email) async{
    var db = await DatabaseHelper.connectDatabase();

    var updatedCustomer = Map<String, dynamic>();
    updatedCustomer["name"] = name;
    updatedCustomer["email"] = email;

    await db.update('customers', updatedCustomer, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Customers>> getCustomers() async {
      var db = await DatabaseHelper.connectDatabase();

      List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * from customers');
      
      return List.generate(maps.length, (i){
        var line = maps[i];
        return Customers(id: line["id"], name: line["name"], email: line["email"]);
      });
  }

  Future<List<Customers>> search(String word) async {
    var db = await DatabaseHelper.connectDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * from customers WHERE name LIKE "%$word%"');

    return List.generate(maps.length, (i){
      var line = maps[i];
      return Customers(id: line["id"], name: line["name"], email: line["email"]);
    });
  }

  Future<void> remove(int id) async{
    var db = await DatabaseHelper.connectDatabase();

    db.delete('customers', where: "id=?", whereArgs: [id]);
  }
}