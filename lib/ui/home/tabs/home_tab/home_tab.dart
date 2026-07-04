import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/engaged.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/message_scan/message_scan_widgets/message_scan_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/tactical_over_view.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_scan_button.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await FirebaseUtils.readUser();

    if (!mounted) return;

    setState(() {});
  }

  Future<void> refreshUser() async {
    await getUser();
  }

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
              Expanded(
                child: Image.asset(
                  AppImages.splash,
                  fit: BoxFit.cover,
                  height: height * 0.14,
                ),
              ),
              SizedBox(width: width * 0.5),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TacticalOverView(
                totalScans: user?.totalScans ?? 0,
                threatsBlocked: user?.threatsBlocked ?? 0,
              ),
              SizedBox(height: height * 0.02),

              Engaged(),

              SizedBox(height: height * 0.02),

              MessageScanButton(onReturn: refreshUser),

              SizedBox(height: height * 0.02),

              UrlScanButton(onReturn: refreshUser),
            ],
          ),
        ),
      ),
    );
  }
}
