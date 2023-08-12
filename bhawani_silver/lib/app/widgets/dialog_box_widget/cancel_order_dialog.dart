import 'package:flutter/material.dart';

class CancelOrderDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const CancelOrderDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Cancel Order"),
      content: const Text("Are you sure you want to cancel this order?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("No"),
        ),
        ElevatedButton(
          onPressed: () {
            onDelete(); // Call the delete function when confirmed
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
