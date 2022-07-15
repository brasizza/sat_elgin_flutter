//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <elgin_sat/elgin_sat_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) elgin_sat_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ElginSatPlugin");
  elgin_sat_plugin_register_with_registrar(elgin_sat_registrar);
}
