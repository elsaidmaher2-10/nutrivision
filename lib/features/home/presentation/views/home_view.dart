import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/widgets/nutri_bottom_nav.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _tab = 0;
  void _onTab(int i) => i == 2 ? context.push('/scanner') : setState(() => _tab = i);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadTodayMeals(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const HomeAppBar(),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (_, state) => HomeContent(state: state),
          ),
        ),
        bottomNavigationBar: NutriBottomNav(currentIndex: _tab, onTap: _onTab),
      ),
    );
  }
}
