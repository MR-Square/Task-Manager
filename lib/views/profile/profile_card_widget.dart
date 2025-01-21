import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.title,
    required this.onEdit,
  });

  final String title;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
          label: const Text('Edit'),
          iconAlignment: IconAlignment.end,
        ),
      ),
    );
  }
}
