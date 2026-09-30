import 'package:google_fonts/google_fonts.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:state_shell/material.dart';

class Button extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const Button({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: EnterpriseColors.selected,
            style: BorderStyle.solid,
            width: 2.2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          backgroundColor: EnterpriseColors.buttonColor,
          foregroundColor: EnterpriseColors.textBright,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.add, size: 20),
        label: Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
