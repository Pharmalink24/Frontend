import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/reminders/logic/reminders_cubit.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../shared/presentation/widgets/card_container_with_title.dart';
import '../../../../../shared/presentation/widgets/text_with_icon.dart';
import '../../../reminders/data/models/reminder.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../reminders/data/repo/reminders_repo.dart';
import 'reminder_list_tile.dart';

class RemindersContainer extends StatefulWidget {
  final List<Reminder> reminders;
  const RemindersContainer({
    super.key,
    this.reminders = const [],
  });

  @override
  State<RemindersContainer> createState() => _RemindersContainerState();
}

class _RemindersContainerState extends State<RemindersContainer>
    with TickerProviderStateMixin {
  TabController? tabBarController;

  @override
  void initState() {
    super.initState();

    // Initialize the TabController
    tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    );
  }

  Widget buildLoadedRemindersWidgets(List<Reminder> reminders) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8.0),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ReminderListTile(reminders[index]);
      },
    );
  }

  Widget buildNoDataWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Icon(
          Icons.playlist_add_check_circle_rounded,
          size: 80,
          color: context.colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noReminders'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReminders(BuildContext context, List<Reminder> reminders) {
    return reminders.isEmpty
        ? buildNoDataWidget(context)
        : buildLoadedRemindersWidgets(reminders);
  }

  // Build the TabBar
  TabBar _buildTabBar() {
    return TabBar(
      controller: tabBarController,
      tabs: [
        Tab(
          text: AppLocalizations.of(context).translate('Previous'),
        ),
        Tab(
          text: AppLocalizations.of(context).translate('Today'),
        ),
        Tab(
          text: AppLocalizations.of(context).translate('Coming'),
        ),
      ],
      splashBorderRadius: BorderRadius.circular(12),
      labelColor: context.colorScheme.onPrimary,
      unselectedLabelColor: context.colorScheme.onSecondary,
      tabAlignment: TabAlignment.center,
      indicatorSize: TabBarIndicatorSize.label,
      enableFeedback: false,
      labelPadding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      labelStyle: AppTextStyle.titleLarge(context).copyWith(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: AppTextStyle.titleSmall(context),
      indicatorColor: context.colorScheme.primary,
      indicatorWeight: 3,
    );
  }

  // Build the TabBarView
  TabBarView _buildTabBody() {
    var bloc = context.read<RemindersCubit>();
    return TabBarView(
      controller: tabBarController,
      children: [
        _buildReminders(context,
            bloc.filterReminders(widget.reminders, ReminderTime.previous)),
        _buildReminders(context,
            bloc.filterReminders(widget.reminders, ReminderTime.today)),
        _buildReminders(context,
            bloc.filterReminders(widget.reminders, ReminderTime.coming)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('yourReminders'),
      isScrollable: false,
      iconButton: TextWithIcon(
        icon: FontAwesomeIcons.solidCalendar,
        onTap: () => context.pushRoute(
          ReminderCalenderRoute(reminders: widget.reminders),
        ),
      ),
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildTabBody(),
          ),
        ],
      ),
    );
  }
}
