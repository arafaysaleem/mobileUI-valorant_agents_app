import 'package:flutter/material.dart';

import '../../helper/assets.dart';

import '../widgets/abilities_list.dart';
import '../widgets/agent_category_dropdown.dart';
import '../widgets/agents_grid.dart';

enum ListFilters { AGENTS, ABILITIES }

class AgentListingsScreen extends StatefulWidget {
  static const routeName = "/agent_listings_screen";

  const AgentListingsScreen();

  @override
  _AgentListingsScreenState createState() => _AgentListingsScreenState();
}

class _AgentListingsScreenState extends State<AgentListingsScreen> {
  // ignore: unused_field
  late ListFilters _currentFilter;

  @override
  void initState() {
    _currentFilter = ListFilters.AGENTS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.listingBg),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Heading
            Text(
              "VALORANT AGENTS",
              style: theme.textTheme.headline1!.copyWith(fontSize: 32),
            ),

            const SizedBox(height: 20),

            //Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilterButton(
                      text: "AGENTS",
                      onTap: () {
                        setState(() {
                          _currentFilter = ListFilters.AGENTS;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FilterButton(
                      text: "ABILITIES",
                      onTap: () {
                        setState(() {
                          _currentFilter = ListFilters.ABILITIES;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            //Radio Buttons
            const AgentCategoryDropdown(),

            const SizedBox(height: 10),

            //List
            Expanded(
              child: _currentFilter == ListFilters.AGENTS
                  ? const AgentsList()
                  : const AbilitiesList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
      elevation: 0,
      hoverElevation: 4,
      height: 40,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      onPressed: onTap,
      child: Text(
        text,
        style: theme.textTheme.headline4!
            .copyWith(fontSize: 19, letterSpacing: 0.5),
      ),
    );
  }
}
