import 'package:flutter/material.dart';
import '../presenters/assignment_presenter.dart';

class AssignmentListScreen extends StatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  State<AssignmentListScreen> createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  final AssignmentPresenter _presenter = AssignmentPresenter();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadAssignments();
  }

  Future<void> _loadAssignments() async {
    await _presenter.loadAssignments();
    setState(() => _isLoading = false);
  }

  void _showAddAssignmentDialog() {
  String newAssignmentTitle = ' ';

    showDialog(
      context: context,
      builder: (content) {
        return AlertDialog(
          title: const Text('Add Assignment'), 
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter Assignment Title'),
            onChanged: (value) {
              newAssignmentTitle = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (newAssignmentTitle.trim().isNotEmpty) {
                  await _presenter.addAssignment(newAssignmentTitle.trim());
                  setState(() {});
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  } 

  String text = '';
  @override
  Widget build(BuildContext context) {
    final assignments = _presenter.assignments;

    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(assignments[index].title),
                value: assignments[index].isCompleted,
                onChanged: (_) async {
                  await _presenter.toggleCompleted(index);
                  setState(() {});
                },
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAssignmentDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

}

