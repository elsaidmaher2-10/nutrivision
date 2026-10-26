import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/widgets/nutri_app_bar.dart';
import '../cubit/login_cubit.dart';
import '../widgets/login_form.dart';
import '../widgets/login_footer.dart';
import '../widgets/social_login_row.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: NutriAppBar(
          title: 'تسجيل الدخول',
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12),
                LoginForm(),
                SizedBox(height: 24),
                SocialLoginRow(),
                SizedBox(height: 24),
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
