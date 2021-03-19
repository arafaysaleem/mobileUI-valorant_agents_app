import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/agent_categories_enum.dart';

final currentCategory = StateProvider.autoDispose<AgentCategories>((ref) {
  return AgentCategories.ALL;
});

class AgentCategoryDropdown extends StatefulWidget {
  const AgentCategoryDropdown();

  @override
  _AgentCategoryDropdownState createState() => _AgentCategoryDropdownState();
}

class _AgentCategoryDropdownState extends State<AgentCategoryDropdown> {
  AgentCategories _category = AgentCategories.ALL;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Spacer(),

          //filter by
          Text(
            "AGENT CATEGORY",
            style: theme.textTheme.headline4!.copyWith(fontSize: 20),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          //DropDown
          Container(
            width: constraints.maxWidth * 0.44,
            padding: const EdgeInsets.only(left: 15, right: 10),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(9),
            ),
            margin: const EdgeInsets.only(right: 10),
            height: 40,
            child: Center(
              child: DropdownButton<AgentCategories>(
                dropdownColor: theme.primaryColor,
                isExpanded: true,
                itemHeight: 50,
                value: _category,
                underline: const SizedBox(height: 0),
                elevation: 0,
                iconSize: 28,
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.white,
                ),
                items: AgentCategories.values
                    .map((cat) => DropdownMenuItem<AgentCategories>(
                          value: cat,
                          child: SizedBox(
                            width: constraints.maxWidth * 0.44,
                            child: Text(
                              cat.inString,
                              style: theme.textTheme.headline4!.copyWith(
                                fontSize: 20,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (AgentCategories? newValue) {
                  setState(() {
                    context.read(currentCategory).state = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
