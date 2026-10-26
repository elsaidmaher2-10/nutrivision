import 'package:flutter/material.dart';
import '../../../../../core/widgets/nutri_card.dart';
import '../../../../../core/widgets/nutri_text_field.dart';

class ProfileMetricsInputs extends StatelessWidget {
  const ProfileMetricsInputs({
    required this.weightCtrl,
    required this.heightCtrl,
    required this.ageCtrl,
    super.key,
  });

  final TextEditingController weightCtrl;
  final TextEditingController heightCtrl;
  final TextEditingController ageCtrl;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('البيانات الجسدية', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: NutriTextField(label: 'الوزن (كجم)', controller: weightCtrl, keyboardType: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(child: NutriTextField(label: 'الطول (سم)', controller: heightCtrl, keyboardType: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(child: NutriTextField(label: 'العمر', controller: ageCtrl, keyboardType: TextInputType.number)),
            ],
          ),
        ],
      ),
    );
  }
}
