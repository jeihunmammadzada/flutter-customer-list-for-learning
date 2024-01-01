import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers/ui/cubit/addCustomer_cubit.dart';
import 'package:customers/ui/cubit/customerEdit_cubit.dart';
import 'package:customers/ui/cubit/customerList_cubit.dart';
import 'package:customers/ui/views/customerList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddCustomerCubit()),
        BlocProvider(create: (context) => CustomerEditCubit()),
        BlocProvider(create: (context) => CustomerListCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CustomerList(),
      ),
    );
  }
}