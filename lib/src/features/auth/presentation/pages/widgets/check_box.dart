import 'package:flutter/material.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';

class AcceptTermsWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;
  const AcceptTermsWidget({
    super.key,
    required this.onChanged,
    this.value = false,
  });

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkColor: Colors.white,
      activeColor: AppColors.primary,
      value: _isChecked,
      onChanged: (bool? value) {
        if (value != null) {
          setState(() {
            _isChecked = value;
          });
          widget.onChanged(value);
        }
      },
    );
  }
}
