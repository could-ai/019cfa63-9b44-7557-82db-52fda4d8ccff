import 'package:flutter/material.dart';
import '../views/overview_panel.dart';
import '../views/storage_panel.dart';
import '../views/admin_panel.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _panels = [
    const OverviewPanel(),
    const StoragePanel(),
    const AdminPanel(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: const Text('CloudStore'),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          if (isDesktop) _buildSidebar(),
          Expanded(
            child: _panels[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: _buildNavItems(),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Icon(Icons.cloud_circle,
                    size: 32, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                const Text(
                  'CloudStore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(child: _buildNavItems()),
        ],
      ),
    );
  }

  Widget _buildNavItems() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildNavItem(0, Icons.dashboard, 'Overview'),
        _buildNavItem(1, Icons.folder, 'My Storage'),
        _buildNavItem(2, Icons.admin_panel_settings, 'Client Admin'),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(icon,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor:
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (MediaQuery.of(context).size.width <= 800 &&
            Scaffold.of(context).isDrawerOpen) {
          Navigator.pop(context);
        }
      },
    );
  }
}
