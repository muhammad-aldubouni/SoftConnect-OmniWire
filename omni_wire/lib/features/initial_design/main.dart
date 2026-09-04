// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import "package:omni_wire/app/themeing/themes.dart";

// void main() {
//   runApp(const EnterpriseLogicStudioApp());
// }

// class EnterpriseLogicStudioApp extends StatelessWidget {
//   const EnterpriseLogicStudioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // JetBrains Mono font configuration for professional IDE aesthetic
//     final textTheme = GoogleFonts.jetBrainsMonoTextTheme(
//       ThemeData.dark().textTheme,
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Enterprise Flutter Logic Studio',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: EnterpriseColors.bg,
//         canvasColor: EnterpriseColors.surface,
//         cardColor: EnterpriseColors.panel,
//         dividerColor: EnterpriseColors.border,
//         textTheme: textTheme,
//         colorScheme: const ColorScheme.dark(
//           surface: EnterpriseColors.surface,
//           primary: EnterpriseColors.operatorAnd,
//           secondary: EnterpriseColors.triggerAccent,
//         ),
//       ),
//       home: const IDEShell(),
//     );
//   }
// }

// enum GroupOperator { and, or }

// abstract class Node {
//   final String id;
//   Node(this.id);
// }

// class ConditionNode extends Node {
//   String field;
//   String operator;
//   String value;

//   ConditionNode({
//     required String id,
//     this.field = 'User.status',
//     this.operator = '==',
//     this.value = "'Active'",
//   }) : super(id);
// }

// class GroupNode extends Node {
//   GroupOperator logicOperator;
//   List<Node> children;

//   GroupNode({
//     required String id,
//     this.logicOperator = GroupOperator.and,
//     List<Node>? children,
//   }) : children = children ?? [],
//        super(id);
// }

// class ActionNode extends Node {
//   String name;
//   String actionType; // 'ApiCall', 'Navigate', 'SetState', 'ShowToast'
//   String endpoint;
//   String method;
//   String route;
//   String stateKey;
//   String stateValue;
//   String toastMessage;

//   ActionNode({
//     required String id,
//     this.name = 'Execute Step',
//     this.actionType = 'ApiCall',
//     this.endpoint = '/api/v2/auth/login',
//     this.method = 'POST',
//     this.route = '/dashboard',
//     this.stateKey = 'isAuthenticated',
//     this.stateValue = 'true',
//     this.toastMessage = 'Operation executed successfully!',
//   }) : super(id);
// }

// class TriggerWorkflow {
//   final String id;
//   String name;
//   String eventName;
//   String description;
//   GroupNode rootCondition;
//   List<ActionNode> actions;

//   TriggerWorkflow({
//     required this.id,
//     required this.name,
//     required this.eventName,
//     required this.description,
//     required this.rootCondition,
//     required this.actions,
//   });
// }

// class IDEShell extends StatefulWidget {
//   const IDEShell({super.key});

//   @override
//   State<IDEShell> createState() => _IDEShellState();
// }

// class _IDEShellState extends State<IDEShell> {
//   String activeWorkflowId = 'wf_1';
//   String viewMode = 'canvas'; // 'canvas' or 'code'
//   String canvasFilter = 'all'; // 'all' or 'focused'

//   // Currently selected entity for Inspector: { type, id, workflowId }
//   Map<String, String>? selectedEntity;

//   // Simulator console logs

//   late List<TriggerWorkflow> workflows;

//   @override
//   void initState() {
//     super.initState();
//     // Pre-populate sample multi-trigger workflows
//     workflows = [
//       TriggerWorkflow(
//         id: 'wf_1',
//         name: 'On Primary Login Tap',
//         eventName: 'ElevatedButton.onPressed',
//         description:
//             'Fired when user clicks primary login button on Auth screen.',
//         rootCondition: GroupNode(
//           id: 'cond_root_1',
//           logicOperator: GroupOperator.and,
//           children: [
//             ConditionNode(
//               id: 'c_101',
//               field: 'FormState.isValid',
//               operator: '==',
//               value: 'true',
//             ),
//             GroupNode(
//               id: 'g_101',
//               logicOperator: GroupOperator.or,
//               children: [
//                 ConditionNode(
//                   id: 'c_102',
//                   field: 'User.role',
//                   operator: '==',
//                   value: "'Admin'",
//                 ),
//                 ConditionNode(
//                   id: 'c_103',
//                   field: 'User.isTrialActive',
//                   operator: '==',
//                   value: 'true',
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           ActionNode(
//             id: 'a_101',
//             name: 'Submit Auth Request',
//             actionType: 'ApiCall',
//             endpoint: '/api/v2/auth/login',
//             method: 'POST',
//           ),
//           ActionNode(
//             id: 'a_102',
//             name: 'Update Global Session',
//             actionType: 'SetState',
//             stateKey: 'isAuthenticated',
//             stateValue: 'true',
//           ),
//           ActionNode(
//             id: 'a_103',
//             name: 'Redirect to Dashboard',
//             actionType: 'Navigate',
//             route: '/dashboard',
//           ),
//         ],
//       ),
//       TriggerWorkflow(
//         id: 'wf_2',
//         name: 'On Application Boot Sequence',
//         eventName: 'StatefulWidget.initState',
//         description:
//             'Executes automatically when application lifecycle boot sequence completes.',
//         rootCondition: GroupNode(
//           id: 'cond_root_2',
//           logicOperator: GroupOperator.and,
//           children: [
//             ConditionNode(
//               id: 'c_201',
//               field: 'LocalStorage.hasAuthToken',
//               operator: '==',
//               value: 'true',
//             ),
//             ConditionNode(
//               id: 'c_202',
//               field: 'Device.isOnline',
//               operator: '==',
//               value: 'true',
//             ),
//           ],
//         ),
//         actions: [
//           ActionNode(
//             id: 'a_201',
//             name: 'Fetch User Profile',
//             actionType: 'ApiCall',
//             endpoint: '/api/v2/user/me',
//             method: 'GET',
//           ),
//           ActionNode(
//             id: 'a_202',
//             name: 'Show Welcome Toast',
//             actionType: 'ShowToast',
//             toastMessage: 'Welcome back to Enterprise Hub!',
//           ),
//         ],
//       ),
//     ];

//     selectedEntity = {'type': 'workflow', 'id': 'wf_1', 'workflowId': 'wf_1'};
//   }

//   TriggerWorkflow get activeWorkflow => workflows.firstWhere(
//     (w) => w.id == activeWorkflowId,
//     orElse: () => workflows.first,
//   );

//   void addNewWorkflow() {
//     final id = 'wf_${DateTime.now().millisecondsSinceEpoch}';
//     final count = workflows.length + 1;
//     final newWf = TriggerWorkflow(
//       id: id,
//       name: 'Custom Event Trigger #$count',
//       eventName: 'Form.onSubmitted',
//       description:
//           'Dedicated trigger pipeline with custom condition tree and actions.',
//       rootCondition: GroupNode(
//         id: 'root_$id',
//         logicOperator: GroupOperator.and,
//         children: [
//           ConditionNode(
//             id: 'cond_$id',
//             field: 'Input.isValid',
//             operator: '==',
//             value: 'true',
//           ),
//         ],
//       ),
//       actions: [
//         ActionNode(
//           id: 'act_$id',
//           name: 'Show Submission Toast',
//           actionType: 'ShowToast',
//           toastMessage: 'Trigger executed successfully!',
//         ),
//       ],
//     );

//     setState(() {
//       workflows.add(newWf);
//       activeWorkflowId = id;
//       selectedEntity = {'type': 'workflow', 'id': id, 'workflowId': id};
//     });
//   }

//   void deleteWorkflow(String id) {
//     if (workflows.length <= 1) {
//       _showSnackbar('At least one trigger workflow must remain.');
//       return;
//     }
//     setState(() {
//       workflows.removeWhere((w) => w.id == id);
//       if (activeWorkflowId == id) {
//         activeWorkflowId = workflows.first.id;
//         selectedEntity = {
//           'type': 'workflow',
//           'id': activeWorkflowId,
//           'workflowId': activeWorkflowId,
//         };
//       }
//     });
//   }

//   void _showSnackbar(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: EnterpriseColors.triggerAccent,
//         content: Text(
//           msg,
//           style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 12),
//         ),
//         persist: true,
//         showCloseIcon: true,

//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top Enterprise Studio App Bar
//             _buildTopNavBar(),
//             const Divider(height: 1, color: EnterpriseColors.border),

//             // Main Workspace Split Layout
//             Expanded(
//               child: Row(
//                 children: [
//                   // Left Panel: Workflows List & Quick Action Palette
//                   _buildLeftSidebar(),
//                   const VerticalDivider(
//                     width: 1,
//                     color: EnterpriseColors.border,
//                   ),

//                   // Center Panel: Visual Logic Canvas OR Generated Dart Code
//                   Expanded(child: _buildCanvasView()),
//                   const VerticalDivider(
//                     width: 1,
//                     color: EnterpriseColors.border,
//                   ),

//                   // Right Panel: Inspector Properties & Simulator Console
//                   _buildRightSidebar(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTopNavBar() {
//     return Container(
//       height: 48,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       color: EnterpriseColors.surface,
//       child: Row(
//         children: [
//           Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               gradient: LinearGradient(
//                 colors: [Colors.blue, Color(0xFF50C878)],
//               ),
//             ),
//             child: const Icon(Icons.alt_route, size: 14, color: Colors.white),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             'OmniWire',
//             style: GoogleFonts.jetBrainsMono(
//               fontWeight: FontWeight.bold,
//               fontSize: 13,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//             decoration: BoxDecoration(
//               color: EnterpriseColors.panel,
//               borderRadius: BorderRadius.circular(4),
//               border: Border.all(color: EnterpriseColors.border),
//             ),
//             child: Text(
//               'v2.5.0-flutter',
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 10,
//                 color: EnterpriseColors.textMuted,
//               ),
//             ),
//           ),
//           const Spacer(),

//           // View Switcher Tabs
//           Container(
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               color: EnterpriseColors.bg,
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(color: EnterpriseColors.border),
//             ),
//             child: Row(
//               children: [
//                 _buildTabBtn(
//                   'Visual Canvas',
//                   Icons.account_tree,
//                   viewMode == 'canvas',
//                   () {
//                     setState(() => viewMode = 'canvas');
//                   },
//                 ),
//                 _buildTabBtn(
//                   'Generated Dart',
//                   Icons.code,
//                   viewMode == 'code',
//                   () {
//                     setState(() => viewMode = 'code');
//                   },
//                 ),
//               ],
//             ),
//           ),

//           const Spacer(),

//           // Top Header Action Buttons
//           OutlinedButton.icon(
//             style: OutlinedButton.styleFrom(
//               foregroundColor: EnterpriseColors.triggerAccent,
//               side: const BorderSide(color: EnterpriseColors.triggerAccent),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             ),
//             onPressed: addNewWorkflow,
//             icon: const Icon(Icons.add, size: 14),
//             label: Text(
//               'New Trigger',
//               style: GoogleFonts.jetBrainsMono(fontSize: 11),
//             ),
//           ),
//           const SizedBox(width: 8),
//           ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: EnterpriseColors.operatorAnd,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             ),
//             onPressed: () {},
//             icon: const Icon(Icons.play_arrow, size: 14),
//             label: Text(
//               'Test Logic',
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 11,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabBtn(
//     String label,
//     IconData icon,
//     bool active,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: active ? EnterpriseColors.panel : Colors.transparent,
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 13,
//               color: active ? Colors.white : EnterpriseColors.textMuted,
//             ),
//             const SizedBox(width: 6),
//             Text(
//               label,
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 11,
//                 color: active ? Colors.white : EnterpriseColors.textMuted,
//                 fontWeight: active ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLeftSidebar() {
//     return SizedBox(
//       width: 260,
//       child: Column(
//         children: [
//           // Sidebar Header
//           Container(
//             padding: const EdgeInsets.all(12),
//             color: EnterpriseColors.surface,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.bolt,
//                       size: 16,
//                       color: EnterpriseColors.triggerAccent,
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       'WORKFLOW TRIGGERS',
//                       style: GoogleFonts.jetBrainsMono(
//                         fontSize: 11,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 6,
//                     vertical: 1,
//                   ),
//                   decoration: BoxDecoration(
//                     color: EnterpriseColors.panel,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: EnterpriseColors.border),
//                   ),
//                   child: Text(
//                     '${workflows.length}',
//                     style: GoogleFonts.jetBrainsMono(
//                       fontSize: 10,
//                       color: EnterpriseColors.textMuted,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 1, color: EnterpriseColors.border),

//           // Workflows Directory List
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: workflows.length,
//               itemBuilder: (context, idx) {
//                 final wf = workflows[idx];
//                 final isActive = wf.id == activeWorkflowId;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       activeWorkflowId = wf.id;
//                       selectedEntity = {
//                         'type': 'workflow',
//                         'id': wf.id,
//                         'workflowId': wf.id,
//                       };
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 6),
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: isActive
//                           ? EnterpriseColors.panel
//                           : EnterpriseColors.surface.withValues(alpha: 0.5),
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         color: isActive
//                             ? EnterpriseColors.operatorAnd
//                             : EnterpriseColors.border,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 22,
//                           height: 22,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: idx % 2 == 0
//                                 ? EnterpriseColors.triggerAccent.withValues(
//                                     alpha: 0.2,
//                                   )
//                                 : EnterpriseColors.operatorOr.withValues(
//                                     alpha: 0.2,
//                                   ),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Text(
//                             'T${idx + 1}',
//                             style: GoogleFonts.jetBrainsMono(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               color: idx % 2 == 0
//                                   ? EnterpriseColors.triggerAccent
//                                   : EnterpriseColors.operatorOr,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 wf.name,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.jetBrainsMono(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 wf.eventName,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.jetBrainsMono(
//                                   fontSize: 10,
//                                   color: EnterpriseColors.textMuted,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(
//                             Icons.delete_outline,
//                             size: 14,
//                             color: EnterpriseColors.textMuted,
//                           ),
//                           onPressed: () => deleteWorkflow(wf.id),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           const Divider(height: 1, color: EnterpriseColors.border),

//           // Action Component Palette
//         ],
//       ),
//     );
//   }

//   Widget _buildCanvasView() {
//     final workflowsToDisplay = canvasFilter == 'focused'
//         ? [activeWorkflow]
//         : workflows;

//     return Container(
//       color: EnterpriseColors.bg,
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // Stacked Trigger Blocks Scroll View
//           Expanded(
//             child: ListView.builder(
//               itemCount: workflowsToDisplay.length,
//               itemBuilder: (context, idx) {
//                 final wf = workflowsToDisplay[idx];
//                 final isSelectedWF = selectedEntity?['id'] == wf.id;

//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       activeWorkflowId = wf.id;
//                       selectedEntity = {
//                         'type': 'workflow',
//                         'id': wf.id,
//                         'workflowId': wf.id,
//                       };
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 20),
//                     decoration: BoxDecoration(
//                       color: EnterpriseColors.surface,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: isSelectedWF
//                             ? EnterpriseColors.operatorAnd
//                             : EnterpriseColors.border,
//                         width: isSelectedWF ? 2 : 1,
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Trigger Header
//                         Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: const BoxDecoration(
//                             color: EnterpriseColors.panel,
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(9),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 32,
//                                 height: 32,
//                                 decoration: BoxDecoration(
//                                   color: EnterpriseColors.triggerAccent
//                                       .withValues(alpha: 0.15),
//                                   borderRadius: BorderRadius.circular(6),
//                                   border: Border.all(
//                                     color: EnterpriseColors.triggerAccent
//                                         .withValues(alpha: 0.3),
//                                   ),
//                                 ),
//                                 child: const Icon(
//                                   Icons.bolt,
//                                   size: 18,
//                                   color: EnterpriseColors.triggerAccent,
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           wf.name,
//                                           style: GoogleFonts.jetBrainsMono(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 6,
//                                             vertical: 1,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: EnterpriseColors
//                                                 .triggerAccent
//                                                 .withValues(alpha: 0.2),
//                                             borderRadius: BorderRadius.circular(
//                                               4,
//                                             ),
//                                             border: Border.all(
//                                               color: EnterpriseColors
//                                                   .triggerAccent
//                                                   .withValues(alpha: 0.4),
//                                             ),
//                                           ),
//                                           child: Text(
//                                             'TRIGGER: ${wf.eventName}',
//                                             style: GoogleFonts.jetBrainsMono(
//                                               fontSize: 9,
//                                               color: EnterpriseColors
//                                                   .triggerAccent,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 2),
//                                     Text(
//                                       wf.description,
//                                       style: GoogleFonts.jetBrainsMono(
//                                         fontSize: 10,
//                                         color: EnterpriseColors.textMuted,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               OutlinedButton.icon(
//                                 style: OutlinedButton.styleFrom(
//                                   foregroundColor:
//                                       EnterpriseColors.actionAccent,
//                                   side: const BorderSide(
//                                     color: EnterpriseColors.actionAccent,
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8,
//                                     vertical: 6,
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     wf.actions.add(
//                                       ActionNode(
//                                         id: 'a_${DateTime.now().millisecondsSinceEpoch}',
//                                       ),
//                                     );
//                                   });
//                                 },
//                                 icon: const Icon(Icons.add, size: 12),
//                                 label: Text(
//                                   'Add Action',
//                                   style: GoogleFonts.jetBrainsMono(
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Split Grid: WHEN Conditions (Left) -> THEN Actions (Right)
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Left: Condition AST Tree
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'WHEN CONDITIONS (BOOLEAN LOGIC TREE)',
//                                       style: GoogleFonts.jetBrainsMono(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: EnterpriseColors.triggerAccent,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     _buildGroupNodeWidget(
//                                       [],
//                                       wf.rootCondition,
//                                       wf.id,
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // Flow Connector Divider
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(height: 40),
//                                     Icon(
//                                       Icons.double_arrow,
//                                       size: 20,
//                                       color: EnterpriseColors.actionAccent
//                                           .withValues(alpha: 0.6),
//                                     ),
//                                     Text(
//                                       'THEN',
//                                       style: GoogleFonts.jetBrainsMono(
//                                         fontSize: 9,
//                                         fontWeight: FontWeight.bold,
//                                         color: EnterpriseColors.textMuted,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // Right: Action Sequence Stack
//                               Expanded(
//                                 flex: 5,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'THEN ACTIONS STACK (${wf.actions.length})',
//                                       style: GoogleFonts.jetBrainsMono(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: EnterpriseColors.actionAccent,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     ...wf.actions.asMap().entries.map((entry) {
//                                       final idx = entry.key;
//                                       final act = entry.value;
//                                       return _buildActionCardWidget(
//                                         act,
//                                         idx,
//                                         wf.id,
//                                       );
//                                     }),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGroupNodeWidget(
//     List<Node> originList,
//     GroupNode group,
//     String workflowId,
//   ) {
//     final isAnd = group.logicOperator == GroupOperator.and;
//     final opColor = isAnd
//         ? EnterpriseColors.operatorAnd
//         : EnterpriseColors.operatorOr;
//     final isSelected = selectedEntity?['id'] == group.id;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedEntity = {
//             'type': 'group',
//             'id': group.id,
//             'workflowId': workflowId,
//           };
//         });
//       },
//       child: Container(
//         margin: const EdgeInsets.only(top: 4),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: EnterpriseColors.surface,
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             color: isSelected ? Colors.white : opColor.withValues(alpha: 0.6),
//             width: isSelected ? 2 : 1,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Group Operator Header
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       group.logicOperator = isAnd
//                           ? GroupOperator.or
//                           : GroupOperator.and;
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: opColor.withValues(alpha: 0.2),
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: opColor),
//                     ),
//                     child: Row(
//                       children: [
//                         Text(
//                           group.logicOperator.name.toUpperCase(),
//                           style: GoogleFonts.jetBrainsMono(
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold,
//                             color: opColor,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         Icon(Icons.sync, size: 10, color: opColor),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Match ${isAnd ? "ALL" : "ANY"} rules below',
//                   style: GoogleFonts.jetBrainsMono(
//                     fontSize: 9,
//                     color: EnterpriseColors.textMuted,
//                   ),
//                 ),
//                 const Spacer(),

//                 // Add Child Condition or Sub-Group
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       group.children.add(
//                         ConditionNode(
//                           id: 'c_${DateTime.now().millisecondsSinceEpoch}',
//                         ),
//                       );
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: EnterpriseColors.panel,
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: EnterpriseColors.border),
//                     ),
//                     child: Text(
//                       '+ Rule',
//                       style: GoogleFonts.jetBrainsMono(
//                         fontSize: 9,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       group.children.add(
//                         GroupNode(
//                           id: 'g_${DateTime.now().millisecondsSinceEpoch}',
//                           logicOperator: isAnd
//                               ? GroupOperator.or
//                               : GroupOperator.and,
//                           children: [],
//                         ),
//                       );
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: EnterpriseColors.panel,
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: EnterpriseColors.border),
//                     ),
//                     child: Text(
//                       '+ Group',
//                       style: GoogleFonts.jetBrainsMono(
//                         fontSize: 9,
//                         color: EnterpriseColors.operatorOr,
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       for (int i = 0; i < originList.length; i++) {
//                         if (originList[i] is GroupNode) {
//                           originList.remove(originList[i]);
//                         }
//                       }
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 2,
//                     ),

//                     child: Icon(
//                       Icons.close,
//                       size: 12,
//                       color: EnterpriseColors.textMuted,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             // Children List Render
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Column(
//                 children: group.children.map((child) {
//                   if (child is ConditionNode) {
//                     return _buildConditionLeafWidget(child, group, workflowId);
//                   } else if (child is GroupNode) {
//                     return _buildGroupNodeWidget(
//                       group.children,
//                       child,
//                       workflowId,
//                     );
//                   }
//                   return const SizedBox();
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConditionLeafWidget(
//     ConditionNode condition,
//     GroupNode parentGroup,
//     String workflowId,
//   ) {
//     final isSelected = selectedEntity?['id'] == condition.id;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedEntity = {
//             'type': 'condition',
//             'id': condition.id,
//             'workflowId': workflowId,
//           };
//         });
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 3),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//           color: EnterpriseColors.bg,
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(
//             color: isSelected
//                 ? EnterpriseColors.triggerAccent
//                 : EnterpriseColors.border,
//             width: isSelected ? 1.5 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             const Icon(
//               Icons.bolt,
//               size: 12,
//               color: EnterpriseColors.triggerAccent,
//             ),
//             const SizedBox(width: 6),
//             Text(
//               condition.field,
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 10,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 6),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
//               decoration: BoxDecoration(
//                 color: Colors.blue.withValues(alpha: 0.2),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//               child: Text(
//                 condition.operator,
//                 style: GoogleFonts.jetBrainsMono(
//                   fontSize: 9,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 6),
//             Text(
//               condition.value,
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 10,
//                 color: EnterpriseColors.actionAccent,
//               ),
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   parentGroup.children.remove(condition);
//                 });
//               },
//               child: const Icon(
//                 Icons.close,
//                 size: 12,
//                 color: EnterpriseColors.textMuted,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionCardWidget(
//     ActionNode action,
//     int index,
//     String workflowId,
//   ) {
//     final isSelected = selectedEntity?['id'] == action.id;

//     IconData icon = Icons.bolt;
//     Color iconColor = EnterpriseColors.actionAccent;
//     if (action.actionType == 'ApiCall') {
//       icon = Icons.lan;
//       iconColor = EnterpriseColors.actionAccent;
//     }
//     if (action.actionType == 'Navigate') {
//       icon = Icons.navigation;
//       iconColor = EnterpriseColors.operatorAnd;
//     }
//     if (action.actionType == 'SetState') {
//       icon = Icons.dataset;
//       iconColor = EnterpriseColors.triggerAccent;
//     }
//     if (action.actionType == 'ShowToast') {
//       icon = Icons.comment;
//       iconColor = EnterpriseColors.operatorOr;
//     }

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedEntity = {
//             'type': 'action',
//             'id': action.id,
//             'workflowId': workflowId,
//           };
//         });
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 6),
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: EnterpriseColors.surface,
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             color: isSelected
//                 ? EnterpriseColors.actionAccent
//                 : EnterpriseColors.border,
//             width: isSelected ? 1.5 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             Text(
//               '${index + 1}.',
//               style: GoogleFonts.jetBrainsMono(
//                 fontSize: 10,
//                 color: EnterpriseColors.textMuted,
//               ),
//             ),
//             const SizedBox(width: 6),
//             Icon(icon, size: 14, color: iconColor),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     action.name,
//                     style: GoogleFonts.jetBrainsMono(
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "_getActionSummary(action)",
//                     style: GoogleFonts.jetBrainsMono(
//                       fontSize: 9,
//                       color: EnterpriseColors.textMuted,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   workflows
//                       .firstWhere((w) => w.id == workflowId)
//                       .actions
//                       .remove(action);
//                 });
//               },
//               child: const Icon(
//                 Icons.delete_outline,
//                 size: 12,
//                 color: EnterpriseColors.textMuted,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRightSidebar() {
//     return SizedBox(
//       width: 280,
//       child: Column(
//         children: [
//           // Inspector Title Header
//           Container(
//             padding: const EdgeInsets.all(12),
//             color: EnterpriseColors.surface,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.tune,
//                       size: 16,
//                       color: EnterpriseColors.operatorAnd,
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       'PROPERTIES INSPECTOR',
//                       style: GoogleFonts.jetBrainsMono(
//                         fontSize: 11,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   selectedEntity?['type']?.toUpperCase() ?? 'NONE',
//                   style: GoogleFonts.jetBrainsMono(
//                     fontSize: 9,
//                     color: EnterpriseColors.textMuted,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 1, color: EnterpriseColors.border),

//           // Inspector Property Form Body
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               color: EnterpriseColors.bg,
//               child: _buildInspectorForm(),
//             ),
//           ),

//           const Divider(height: 1, color: EnterpriseColors.border),
//         ],
//       ),
//     );
//   }

//   Widget _buildInspectorForm() {
//     if (selectedEntity == null) {
//       return Center(
//         child: Text(
//           'Select any element on canvas\nto inspect & edit properties.',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.jetBrainsMono(
//             fontSize: 11,
//             color: EnterpriseColors.textMuted,
//           ),
//         ),
//       );
//     }

//     final type = selectedEntity!['type'];
//     final id = selectedEntity!['id'];
//     final wfId = selectedEntity!['workflowId']!;
//     final wf = workflows.firstWhere(
//       (w) => w.id == wfId,
//       orElse: () => activeWorkflow,
//     );

//     if (type == 'workflow') {
//       return ListView(
//         children: [
//           _buildFormHeader('TRIGGER WORKFLOW CONFIG'),
//           _buildTextField(
//             'Workflow Title',
//             wf.name,
//             (val) => setState(() => wf.name = val),
//           ),
//           _buildTextField(
//             'Event Listener',
//             wf.eventName,
//             (val) => setState(() => wf.eventName = val),
//           ),
//           _buildTextField(
//             'Description',
//             wf.description,
//             (val) => setState(() => wf.description = val),
//           ),
//         ],
//       );
//     } else if (type == 'condition') {
//       final cond = _findConditionInTree(wf.rootCondition, id!);
//       if (cond == null) return const SizedBox();
//       return ListView(
//         children: [
//           _buildFormHeader('CONDITION RULE EDITOR'),
//           _buildTextField(
//             'Evaluated Field',
//             cond.field,
//             (val) => setState(() => cond.field = val),
//           ),
//           _buildTextField(
//             'Comparison Operator',
//             cond.operator,
//             (val) => setState(() => cond.operator = val),
//           ),
//           _buildTextField(
//             'Match Value',
//             cond.value,
//             (val) => setState(() => cond.value = val),
//           ),
//         ],
//       );
//     } else if (type == 'action') {
//       final act = wf.actions.firstWhere(
//         (a) => a.id == id,
//         orElse: () => wf.actions.first,
//       );
//       return ListView(
//         children: [
//           _buildFormHeader('ACTION STEP CONFIG'),
//           _buildTextField(
//             'Action Title',
//             act.name,
//             (val) => setState(() => act.name = val),
//           ),
//           _buildDropdown(
//             'Action Type',
//             act.actionType,
//             ['ApiCall', 'Navigate', 'SetState', 'ShowToast'],
//             (val) {
//               setState(() => act.actionType = val!);
//             },
//           ),
//           if (act.actionType == 'ApiCall') ...[
//             _buildTextField(
//               'Endpoint',
//               act.endpoint,
//               (val) => setState(() => act.endpoint = val),
//             ),
//             _buildDropdown('Method', act.method, [
//               'GET',
//               'POST',
//               'PUT',
//               'DELETE',
//             ], (val) => setState(() => act.method = val!)),
//           ],
//           if (act.actionType == 'Navigate')
//             _buildTextField(
//               'Route Path',
//               act.route,
//               (val) => setState(() => act.route = val),
//             ),
//           if (act.actionType == 'ShowToast')
//             _buildTextField(
//               'Message',
//               act.toastMessage,
//               (val) => setState(() => act.toastMessage = val),
//             ),
//         ],
//       );
//     }

//     return const SizedBox();
//   }

//   ConditionNode? _findConditionInTree(GroupNode group, String condId) {
//     for (var child in group.children) {
//       if (child is ConditionNode && child.id == condId) return child;
//       if (child is GroupNode) {
//         final found = _findConditionInTree(child, condId);
//         if (found != null) return found;
//       }
//     }
//     return null;
//   }

//   Widget _buildFormHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Text(
//         title,
//         style: GoogleFonts.jetBrainsMono(
//           fontSize: 11,
//           fontWeight: FontWeight.bold,
//           color: EnterpriseColors.operatorAnd,
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     String value,
//     ValueChanged<String> onChanged,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: GoogleFonts.jetBrainsMono(
//               fontSize: 10,
//               color: EnterpriseColors.textMuted,
//             ),
//           ),
//           const SizedBox(height: 4),
//           TextFormField(
//             initialValue: value,
//             onChanged: onChanged,
//             style: GoogleFonts.jetBrainsMono(fontSize: 11, color: Colors.white),
//             decoration: InputDecoration(
//               isDense: true,
//               filled: true,
//               fillColor: EnterpriseColors.surface,
//               contentPadding: const EdgeInsets.all(8),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4),
//                 borderSide: const BorderSide(color: EnterpriseColors.border),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4),
//                 borderSide: const BorderSide(
//                   color: EnterpriseColors.operatorAnd,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDropdown(
//     String label,
//     String value,
//     List<String> options,
//     ValueChanged<String?> onChanged,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: GoogleFonts.jetBrainsMono(
//               fontSize: 10,
//               color: EnterpriseColors.textMuted,
//             ),
//           ),
//           const SizedBox(height: 4),
//           DropdownButtonFormField<String>(
//             initialValue: value,
//             onChanged: onChanged,
//             dropdownColor: EnterpriseColors.surface,
//             style: GoogleFonts.jetBrainsMono(fontSize: 11, color: Colors.white),
//             decoration: InputDecoration(
//               isDense: true,
//               filled: true,
//               fillColor: EnterpriseColors.surface,
//               contentPadding: const EdgeInsets.all(8),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4),
//                 borderSide: const BorderSide(color: EnterpriseColors.border),
//               ),
//             ),
//             items: options
//                 .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
