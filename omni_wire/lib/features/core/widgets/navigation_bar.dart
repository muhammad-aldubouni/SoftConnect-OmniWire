import "package:omni_wire/features/core/themeing/themes.dart";
import "package:state_shell/material.dart";
import "package:google_fonts/google_fonts.dart";

Widget buildTopNavBar() {
  return Container(
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    color: EnterpriseColors.surface,
    child: Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(colors: [Colors.blue, Color(0xFF50C878)]),
          ),
          child: const Icon(Icons.alt_route, size: 14, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Text(
          'OmniWire',
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: EnterpriseColors.textBright,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: EnterpriseColors.panel,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: EnterpriseColors.border),
          ),
          child: Text(
            'v0.1',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              color: EnterpriseColors.textMuted,
            ),
          ),
        ),

        // Top Header Action Buttons
        // OutlinedButton.icon(
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: EnterpriseColors.triggerAccent,
        //     side: const BorderSide(color: EnterpriseColors.triggerAccent),
        //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        //   ),
        //   onPressed: () {},
        //   icon: const Icon(Icons.add, size: 14),
        //   label: Text(
        //     'New Trigger',
        //     style: GoogleFonts.jetBrainsMono(fontSize: 11),
        //   ),
        // ),
        // const SizedBox(width: 8),
        // ElevatedButton.icon(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: EnterpriseColors.operatorAnd,
        //     foregroundColor: Colors.white,
        //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        //   ),
        //   onPressed: () {},
        //   icon: const Icon(Icons.play_arrow, size: 14),
        //   label: Text(
        //     'Test Logic',
        //     style: GoogleFonts.jetBrainsMono(
        //       fontSize: 11,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
