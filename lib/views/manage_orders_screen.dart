import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ManageOrdersScreen extends StatelessWidget {
  const ManageOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Orders',
              style: TextStyle(color: AppColors.text)),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('New order +',
                  style: TextStyle(color: AppColors.accent)),
            )
          ],
          backgroundColor: AppColors.background,
          bottom: TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.secondaryText,
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'Processing'),
              Tab(text: 'Completed'),
              Tab(text: 'Disputed'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(4, (index) =>
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) => Card(
                  color: AppColors.lightPurple,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Order #${i + 1}',
                        style: TextStyle(color: AppColors.text)),
                    subtitle: Text('Status: Pending',
                        style: TextStyle(color: AppColors.secondaryText)),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}