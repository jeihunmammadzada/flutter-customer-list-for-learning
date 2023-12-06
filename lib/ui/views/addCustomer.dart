import 'package:customers/ui/cubit/addCustomer_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  var tfName = TextEditingController();
  var tfEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Customer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfName,
                decoration: const InputDecoration(
                  hintText: "Enter customer name",
                ),
              ),

              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: tfEmail,
                decoration: const InputDecoration(
                  hintText: "Enter customer email",
                ),

              ),
              ElevatedButton(
                  onPressed: (){
                    context.read<AddCustomerCubit>().Save(tfName.text, tfEmail.text);
                    Navigator.pop(context);
                  },
                  child: const Text("SAVE")
              )
            ],
          ),
        ),
      ),
    );
  }
}
