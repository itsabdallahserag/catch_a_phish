import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/history_tab/widgets/item_history.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/tactical_over_view.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: AppColors.glassGrey,
        elevation: 0,
        title: Row(
          children: [
            Text('Scan History', style: AppStyles.light24White),
            Spacer(),
            Icon(Icons.search, color: AppColors.mediumGrey, size: 24),
          ],
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TacticalOverView(),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.blackOverlay20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Recent Activity', style: AppStyles.semiBold18White),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'clear',
                            style: AppStyles.semiBold12Primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => ItemHistory(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: height * 0.02),
              
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
