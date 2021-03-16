import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'abilities_provider.dart';
import 'agents_provider.dart';

final abilitiesProvider = Provider<AbilitiesProvider>((ref) {
  return AbilitiesProvider();
});

final agentsProvider = Provider<AgentsProvider>((ref) {
  return AgentsProvider();
});
