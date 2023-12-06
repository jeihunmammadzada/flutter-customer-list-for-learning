import 'package:customers/data/entity/customers.dart';
import 'package:customers/ui/cubit/customerEdit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerEdit extends StatefulWidget {
  Customers customer;

  CustomerEdit({required this.customer});

  @override
  State<CustomerEdit> createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  var tfName = TextEditingController();
  var tfEmail = TextEditingController();

  @override
  void initState() {
    super.initState();

    var customer = widget.customer;
    tfName.text = customer.name;
    tfEmail.text = customer.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer info",
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
                  onPressed: () {
                    context
                        .read<CustomerEditCubit>()
                        .Update(widget.customer.id, tfName.text, tfEmail.text);

                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE"))
            ],
          ),
        ),
      ),
    );
  }
}
