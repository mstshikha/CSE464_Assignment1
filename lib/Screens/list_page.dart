import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> listOfItems = ["Task 1", "Task 2", "Task 3", "Task 4"];
  int taskCounter = 5; // Counter for additional tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Board"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listOfItems.length,
        itemBuilder: (context, index) {
          DateTime now = DateTime.now();
          // Using DateFormat for both date and time for consistency
          String formattedDate = DateFormat('h:mm a | MMMM | yyyy').format(now);

          return Card(
            elevation: 3,
            color: const Color.fromARGB(255, 213, 222, 230),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfItems[index],
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10), // Add some space between task and additional text
                  const Text(
                    "My personal task management and planning solution for\nplanning my day, week & months",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10), // Add some space
                  Text(
                    "Time: $formattedDate",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            listOfItems.add("Task $taskCounter");
            taskCounter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}