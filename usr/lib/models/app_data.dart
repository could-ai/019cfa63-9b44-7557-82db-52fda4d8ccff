class StorageItem {
  final String id;
  final String name;
  final String size;
  final String type;
  final DateTime modified;

  StorageItem({
    required this.id,
    required this.name,
    required this.size,
    required this.type,
    required this.modified,
  });
}

class ClientUser {
  final String id;
  final String name;
  final String email;
  final String role;
  final double storageUsedGb;
  final double storageLimitGb;

  ClientUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.storageUsedGb,
    required this.storageLimitGb,
  });
}

// Mock Data for UI Demonstration
final List<StorageItem> mockFiles = [
  StorageItem(
      id: '1',
      name: 'Q4_Financial_Report.pdf',
      size: '2.4 MB',
      type: 'PDF',
      modified: DateTime.now().subtract(const Duration(days: 1))),
  StorageItem(
      id: '2',
      name: 'Project_Assets.zip',
      size: '145.0 MB',
      type: 'Archive',
      modified: DateTime.now().subtract(const Duration(days: 3))),
  StorageItem(
      id: '3',
      name: 'Client_Meeting_Recording.mp4',
      size: '450.2 MB',
      type: 'Video',
      modified: DateTime.now().subtract(const Duration(days: 5))),
  StorageItem(
      id: '4',
      name: 'Database_Backup.sql',
      size: '1.2 GB',
      type: 'Database',
      modified: DateTime.now().subtract(const Duration(days: 10))),
  StorageItem(
      id: '5',
      name: 'Company_Logo.png',
      size: '850 KB',
      type: 'Image',
      modified: DateTime.now().subtract(const Duration(days: 15))),
];

final List<ClientUser> mockUsers = [
  ClientUser(
      id: 'u1',
      name: 'Admin User',
      email: 'admin@cloudstore.com',
      role: 'Super Admin',
      storageUsedGb: 45.5,
      storageLimitGb: 1000.0),
  ClientUser(
      id: 'u2',
      name: 'Sarah Jenkins',
      email: 'sarah.j@client.com',
      role: 'Client Admin',
      storageUsedGb: 12.0,
      storageLimitGb: 50.0),
  ClientUser(
      id: 'u3',
      name: 'Mike Ross',
      email: 'mike.r@client.com',
      role: 'User',
      storageUsedGb: 4.2,
      storageLimitGb: 10.0),
  ClientUser(
      id: 'u4',
      name: 'Elena Gilbert',
      email: 'elena.g@client.com',
      role: 'User',
      storageUsedGb: 8.9,
      storageLimitGb: 10.0),
];
