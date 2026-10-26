import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/nutri_button.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import 'profile_metrics_inputs.dart';
import 'profile_goal_selector.dart';
import 'profile_activity_selector.dart';

class ProfileFormBody extends StatefulWidget {
  const ProfileFormBody({super.key});
  @override
  State<ProfileFormBody> createState() => _ProfileFormBodyState();
}

class _ProfileFormBodyState extends State<ProfileFormBody> {
  String _goal = 'خسارة الوزن';
  String _activity = 'متوسط (3-4 أيام تمرين)';
  final _wCtrl = TextEditingController(text: '70');
  final _hCtrl = TextEditingController(text: '175');
  final _aCtrl = TextEditingController(text: '25');

  @override
  void dispose() {
    _wCtrl.dispose(); _hCtrl.dispose(); _aCtrl.dispose();
    super.dispose();
  }

  void _onSave(BuildContext ctx) {
    ctx.read<ProfileCubit>().saveProfile(
      weight: double.tryParse(_wCtrl.text) ?? 70,
      height: double.tryParse(_hCtrl.text) ?? 175,
      age: int.tryParse(_aCtrl.text) ?? 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (ctx, state) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ProfileMetricsInputs(weightCtrl: _wCtrl, heightCtrl: _hCtrl, ageCtrl: _aCtrl),
          const SizedBox(height: 14),
          ProfileGoalSelector(selectedGoal: _goal, onSelect: (g) => setState(() => _goal = g)),
          const SizedBox(height: 14),
          ProfileActivitySelector(selectedActivity: _activity, onSelect: (a) => setState(() => _activity = a)),
          const SizedBox(height: 18),
          NutriButton(label: 'حفظ وتحديث الخطة', onPressed: () => _onSave(ctx), isLoading: state is ProfileUpdating),
        ]),
      ),
    );
  }
}
