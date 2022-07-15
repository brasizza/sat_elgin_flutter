#include "include/elgin_sat/elgin_sat_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "elgin_sat_plugin.h"

void ElginSatPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  elgin_sat::ElginSatPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
