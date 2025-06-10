import 'package:flutter/material.dart';

class NewContractEmployee extends StatelessWidget {
  const NewContractEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contract Employee List')),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual data count
        itemBuilder: (context, index) => ListTile(
          title: Text('Contract Employee #$index'),
          subtitle: Text('Skill: Example Skill'),
          onTap: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open your add new contract employee form here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 