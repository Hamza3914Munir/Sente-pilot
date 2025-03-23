import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with avatar + greeting
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightPurple,
                    child: Text(
                      'GR',
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Hello 👋\nGushu',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Balance section with purple background
              Container(
                width: double.infinity,
                color: AppColors.primary,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available balance',
                      style: TextStyle(color: AppColors.background),
                    ),
                    Text(
                      '₦0.00',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Locked in escrow: ₦0.00',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.background,
                              foregroundColor: AppColors.primary,
                            ),
                            onPressed: () {},
                            child: const Text('Deposit funds'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.background,
                              foregroundColor: AppColors.accent,
                            ),
                            onPressed: () {},
                            child: const Text('Withdraw cash'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Transactions header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Filter by',
                      style: TextStyle(color: AppColors.accent),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),

              // Transactions list (sample placeholder)
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => Card(
                    color: AppColors.lightPurple,
                    child: ListTile(
                      title: Text(
                        'Transaction #${index + 1}',
                        style: TextStyle(color: AppColors.text),
                      ),
                      subtitle: Text(
                        'Completed',
                        style: TextStyle(color: AppColors.secondaryText),
                      ),
                      trailing: Text(
                        '₦${(index + 1) * 100}',
                        style: TextStyle(color: AppColors.text),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}