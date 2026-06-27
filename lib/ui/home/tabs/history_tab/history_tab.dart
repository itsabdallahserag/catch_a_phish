import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/scan_history_model.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/home/tabs/history_tab/widgets/item_history.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/tactical_over_view.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  List<ScanHistoryModel> scans = [];
  bool isLoading = false;
  UserModel? user;
  @override
  void initState() {
    super.initState();
    loadScans();
  }

  Future<void> loadScans() async {
    setState(() {
      isLoading = true;
    });
    scans = await FirebaseUtils.getUserScansOnce();
    getUser();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getUser() async {
    user = await FirebaseUtils.readUser();
    if (!mounted) return;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: AppColors.glassGrey,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.scanHistory,
              style: AppStyles.light24White,
            ),
            const Spacer(),
            const Icon(Icons.search, color: AppColors.mediumGrey, size: 24),
          ],
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TacticalOverView(
              totalScans: user?.totalScans ?? 0,
              threatsBlocked: user?.threatsBlocked ?? 0,
            ),
            SizedBox(height: height * 0.03),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.blackOverlay20,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.recentActivity,
                            style: AppStyles.semiBold18White,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              AppDialogUtils.showMessage(
                                context: context,
                                message: AppLocalizations.of(
                                  context,
                                )!.clearAllScansConfirmation,
                                negActionCallBack: () {
                                  Navigator.pop(context);
                                },
                                negActionName: AppLocalizations.of(
                                  context,
                                )!.cancel,
                                posActionCallBack: () async {
                                  await FirebaseUtils.cleanScansOnce();
                                  await loadScans();
                                },
                                posActionName: AppLocalizations.of(
                                  context,
                                )!.clear,
                                title: AppLocalizations.of(
                                  context,
                                )!.clearHistory,
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.clear,
                              style: AppStyles.semiBold12Primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (isLoading)
                      const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else
                      Expanded(
                        child: scans.isEmpty
                            ? Center(
                                child: Text(
                                  AppLocalizations.of(context)!.noHistoryYet,
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: loadScans,
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(12),
                                  itemCount: scans.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: height * 0.02),
                                  itemBuilder: (context, index) {
                                    return ItemHistory(scan: scans[index]);
                                  },
                                ),
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
