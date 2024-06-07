import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/features/error/connection_lost_widget.dart';
import '../../../../shared/presentation/logic/connection/network_cubit.dart';
import '../../../../shared/presentation/logic/connection/network_state.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../data/models/navigation_items.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainScreen extends AutoRouter {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<NetworkBloc, NetworkState>(
        buildWhen: (previous, current) => current != previous,
        builder: (context, state) {
          if (state is ConnectionFailure) {
                        return const Scaffold(
              body: Center(
                child: ConnectionLost(),
              ),
            );

          } else {
            return AutoTabsScaffold(
              resizeToAvoidBottomInset: false,
              routes: const [
                HomeRoute(),
                LandingPrescriptionRoute(),
                DrugInteractionRoute(),
                ProfileRoute(),
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                return AppBottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: getBottomNavigationBarItems(navigationItems),
                );
              },
            );
          }
        },
      ),
    );
  }
}
