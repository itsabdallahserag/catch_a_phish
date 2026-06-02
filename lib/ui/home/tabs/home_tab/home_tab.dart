import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/engaged.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/message_scan_widgets/message_scan_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/tactical_over_view.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan_widgets/url_scan_button.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: height * 0.08,
          backgroundColor: AppColors.glassGrey,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset(AppImages.splash,fit: BoxFit.cover, height: height * 0.14)),
                SizedBox(width: width * 0.5), 
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TacticalOverView(),
            SizedBox(height: height*0.02,),
            Engaged(),
            SizedBox(height: height*0.02,),
            MessageScanButton(),
            SizedBox(height: height*0.02,),
            UrlScanButton()
          ],
            ),
      )   );
  }
}