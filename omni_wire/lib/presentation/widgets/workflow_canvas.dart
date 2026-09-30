import "package:omni_wire/core/themeing/themes.dart";
import "package:omni_wire/presentation/widgets/button.dart";
import "package:omni_wire/presentation/viewmodels/embedded_code_builder_viewmodel.dart";
import "package:state_shell/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:state_shell/state_shell.dart";
import 'package:omni_wire/presentation/widgets/condition_group_view.dart';
import 'package:omni_wire/presentation/widgets/code_block_view.dart';

Widget workflowCanvas(EmbeddedCodeBuilderViewmodel vm) {
  return Container(
    color: EnterpriseColors.bg,
    padding: EdgeInsets.only(left: 10, right: 14),
    child: Column(
      spacing: 40,
      children: [
        // Stacked Workflows Blocks Scroll View
        Observer(
          notifier: vm.workflows,
          builder: () => Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   gradient: LinearGradient(
              //     colors: [
              //       const Color.fromARGB(255, 31, 38, 56),
              //       const Color.fromARGB(255, 34, 45, 56),
              //     ],
              //   ),
              // ),
              color: EnterpriseColors.bg,
              child: vm.workflows.data.isEmpty
                  ? SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.account_tree_rounded, size: 72),
                            Text(
                              "No Workflows Yet !",
                              style: GoogleFonts.jetBrainsMono(
                                // or --> alanSans or --> aldrich
                                fontSize: 18,
                                fontWeight: .normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount:
                          vm.workflows.data.length, // number of workflows
                      itemBuilder: (context, idx) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                          child: GestureDetector(
                            onTap: () {
                              // selecting the workflow
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: EnterpriseColors.bg,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: EnterpriseColors.textMuted,
                                    blurRadius: 2,
                                    blurStyle: .outer,
                                  ),
                                ],
                                // used to check if the workflow is selected
                                // border: Border.all(
                                //   color: isSelectedWF
                                //       ? EnterpriseColors.operatorAnd
                                //       : EnterpriseColors.border,
                                //   width: isSelectedWF ? 2 : 1,
                                // ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Trigger Header
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: EnterpriseColors.border,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      spacing: 12,

                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: EnterpriseColors.green
                                                .withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: EnterpriseColors.green
                                                  .withValues(alpha: 0.3),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.line_style,
                                            size: 24,
                                            color: EnterpriseColors.green,
                                          ),
                                        ),
                                        Text(
                                          vm.workflows.data[idx].name,
                                          style: GoogleFonts.jetBrainsMono(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: EnterpriseColors.textBright,
                                          ),
                                        ),
                                        const Spacer(),
                                        Button(
                                          label: "Add Action",
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Split Grid: WHEN Conditions (Left) -> THEN Actions (Right)
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Left: Condition AST Tree
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'WHEN CONDITIONS (BOOLEAN LOGIC TREE)',
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: EnterpriseColors
                                                          .operatorAnd,
                                                    ),
                                              ),
                                              const SizedBox(height: 20),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: EnterpriseColors
                                                        .selected,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      EnterpriseColors.surface,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: EnterpriseColors
                                                          .selected,
                                                      blurRadius: 5,
                                                      //offset: Offset(2, -2),
                                                      blurStyle: .solid,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    12.0,
                                                  ),
                                                  child: ConditionGroupView(
                                                    isRoot: true,
                                                    onPressed: () {},
                                                    operation: .or,
                                                    childs: [
                                                      ConditionGroupView(
                                                        onPressed: () {},
                                                        operation: .and,
                                                        childs: [
                                                          CodeBlockView(
                                                            onPressed: () {},
                                                            codeBlock: vm
                                                                .components
                                                                .data[0]
                                                                .triggers[0],
                                                          ),
                                                          CodeBlockView(
                                                            onPressed: () {},
                                                            codeBlock: vm
                                                                .components
                                                                .data[0]
                                                                .triggers[0],
                                                          ),
                                                        ],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .triggers[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .triggers[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .triggers[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .triggers[0],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // _buildGroupNodeWidget(
                                              //   [],
                                              //   wf.rootCondition,
                                              //   wf.id,
                                              // ),
                                            ],
                                          ),
                                        ),

                                        // Flow Connector Divider
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: .center,
                                            children: [
                                              const SizedBox(height: 100),
                                              Icon(
                                                Icons.double_arrow_rounded,
                                                size: 20,
                                                color: EnterpriseColors
                                                    .actionAccent
                                                    .withValues(alpha: 0.6),
                                              ),
                                              Text(
                                                'THEN',
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: EnterpriseColors
                                                          .textMuted,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Right: Action Sequence Stack
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Actions Set',
                                                overflow: .ellipsis,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: EnterpriseColors
                                                          .actionAccent,
                                                    ),
                                              ),
                                              const SizedBox(height: 20),

                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: EnterpriseColors
                                                        .selected,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      EnterpriseColors.surface,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: EnterpriseColors
                                                          .selected,
                                                      blurRadius: 10,
                                                      //offset: Offset(-2, -2),
                                                      blurStyle: .solid,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        10.0,
                                                        10.0,
                                                        10.0,
                                                        10.0,
                                                      ),
                                                  child: Column(
                                                    spacing: 10,
                                                    children: [
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                      CodeBlockView(
                                                        onPressed: () {},
                                                        codeBlock: vm
                                                            .components
                                                            .data[0]
                                                            .actions[0],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],

                                            // build action ui here !
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Align(
                                    alignment: AlignmentGeometry.xy(1, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: EnterpriseColors.textMuted,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}
