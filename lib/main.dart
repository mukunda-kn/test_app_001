import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app_001/api.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiValue = ref.watch(apiClassProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: apiValue.when(data: (data) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: data.placeHolders.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(e.title??'No Data'),
            )).toList(),
          ), error: (error, stackTrace) {
            log('Error', error: error, stackTrace: stackTrace,);
            return Center(child: Text('Error'),);
          }, loading: () => Center(child: CircularProgressIndicator(),),),
        ),
      ),
    );
  }
}
