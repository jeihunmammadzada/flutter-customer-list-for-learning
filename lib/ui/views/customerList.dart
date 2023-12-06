import 'package:customers/data/entity/customers.dart';
import 'package:customers/ui/cubit/addCustomer_cubit.dart';
import 'package:customers/ui/cubit/customerList_cubit.dart';
import 'package:customers/ui/views/addCustomer.dart';
import 'package:customers/ui/views/customerEdit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  var tfSearch = TextEditingController();
  bool hasSearch = false;

  @override
  void initState() {
    super.initState();

    context.read<CustomerListCubit>().getCustomers();
    context.read<CustomerListCubit>().search("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: hasSearch
            ? TextField(
                controller: tfSearch,
                style: const TextStyle(color: Colors.white),
                onChanged: (data) {
                  context.read<CustomerListCubit>().search(data);
                },
                decoration: const InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white)),
              )
            : const Text(
                "Customers",
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          hasSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      hasSearch = false;
                    });
                    context.read<CustomerListCubit>().getCustomers();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      hasSearch = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
        ],
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<CustomerListCubit, List<Customers>>(
        builder: (context, customerList) {
          if (customerList.isNotEmpty) {
            return ListView.builder(
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                var item = customerList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerEdit(customer: item),
                        )).then((value){
                        context.read<CustomerListCubit>().getCustomers();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(item.email),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                    content: Text("Are u sure to delete ${item.name}?"),
                                      action: SnackBarAction(
                                        label: "Yes",
                                        onPressed: (){
                                          context.read<CustomerListCubit>().remove(item.id);
                                        },
                                      ),
                                  )
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black54,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const AddCustomer()))
                .then((value){
                  context.read<CustomerListCubit>().getCustomers();
          });
        },
      ),
    );
  }
}
