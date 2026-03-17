import 'package:flutter/material.dart';
import '../models/app_data.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Client Administration',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'User creation will be handled via Supabase Auth.')),
                  );
                },
                icon: const Icon(Icons.person_add),
                label: const Text('Add Client'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade200)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowColor:
                          WidgetStatePropertyAll(Colors.grey.shade50),
                      columns: const [
                        DataColumn(
                            label: Text('Client Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Role',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Storage Usage',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Actions',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: mockUsers
                          .map((user) => DataRow(
                                cells: [
                                  DataCell(Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        child: Text(user.name[0],
                                            style:
                                                const TextStyle(fontSize: 12)),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(user.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )),
                                  DataCell(Text(user.email)),
                                  DataCell(Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: user.role == 'Super Admin'
                                          ? Colors.purple.shade50
                                          : Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      user.role,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: user.role == 'Super Admin'
                                            ? Colors.purple.shade700
                                            : Colors.blue.shade700,
                                      ),
                                    ),
                                  )),
                                  DataCell(
                                    SizedBox(
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${user.storageUsedGb} GB',
                                                  style: const TextStyle(
                                                      fontSize: 12)),
                                              Text('${user.storageLimitGb} GB',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          LinearProgressIndicator(
                                            value: user.storageUsedGb /
                                                user.storageLimitGb,
                                            backgroundColor:
                                                Colors.grey.shade200,
                                            color: (user.storageUsedGb /
                                                        user.storageLimitGb) >
                                                    0.8
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  DataCell(Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 20, color: Colors.grey),
                                        onPressed: () {},
                                        tooltip: 'Edit Client',
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.settings,
                                            size: 20, color: Colors.grey),
                                        onPressed: () {},
                                        tooltip: 'Manage Quota',
                                      ),
                                    ],
                                  )),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
