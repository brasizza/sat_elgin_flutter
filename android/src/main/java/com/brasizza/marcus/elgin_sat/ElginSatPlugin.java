package com.brasizza.marcus.elgin_sat;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import java.util.HashMap;

/** ElginSatPlugin */
public class ElginSatPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  ServiceSat sat;
  private Context context;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "elgin_sat");
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    Log.d("sat", call.method);
    String codAtivacao = "";

    Integer numeroSessao = 0;
    numeroSessao = call.argument("numeroSessao");
    if (numeroSessao == null) {
      numeroSessao = UtilidadesGerais.gerarNumeroSessao();
    }
    switch(call.method){
      default:
        result.notImplemented();
        break;
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;

      case "ativarSat":
        HashMap ativarSat = call.argument("ativar");
        result.success(sat.ativarSAT( numeroSessao, ativarSat));
        break;

      case "associarAssinatura":
        HashMap associar = call.argument("associar");
        result.success(sat.associarAssinatura( numeroSessao, associar));
        break;

      case "deviceInfo":
        result.success(sat.deviceInfo());
        break;

      case "consultarSat":
        result.success(sat.consultarSAT(numeroSessao));
        break;

      case "statusOperacional":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.statusOperacional(numeroSessao,codAtivacao));
        break;

      case "logSat":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.extrairLog(numeroSessao,codAtivacao));
        break;

      case "atualizarSoftware":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.atualizarSoftwareSat(numeroSessao,codAtivacao));
        break;

      case "consultarSessao":
        codAtivacao = call.argument("codigoAtivacao");
        int sessaoConsultar = call.argument("sessaoConsultar");
        result.success(sat.consultarNumeroSessao(numeroSessao,codAtivacao, sessaoConsultar));
        break;

      case "desbloquearSat":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.desbloquearSat(numeroSessao,codAtivacao));
        break;


      case "bloquearSat":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.bloquearSat(numeroSessao,codAtivacao));
        break;


      case "testeFimaFim":
        codAtivacao = call.argument("codigoAtivacao");
        String xmlFimaFim = call.argument("xml");
        result.success(sat.testeFimAFim(numeroSessao,codAtivacao,xmlFimaFim));
        break;

      case "configurarRede":
        codAtivacao = call.argument("codigoAtivacao");
        String dadosRede = call.argument("dadosRede");
        result.success(sat.configurarInterfaceDeRede(numeroSessao,codAtivacao,dadosRede));
        break;


      case "trocarCodigo":
        codAtivacao = call.argument("codigoAtivacao");
        HashMap dadosTroca = call.argument("dadosTroca");
        result.success(sat.trocarCodigoDeAtivacao(numeroSessao,codAtivacao,dadosTroca));
        break;


      case "consultarUltimaSessao":
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.consultarUltimaSessaoFiscal(numeroSessao,codAtivacao));
        break;



      case "enviarVenda":
        String xmlVenda = call.argument("xml");
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.enviarVenda(numeroSessao,codAtivacao, xmlVenda));
        break;


      case "cancelarVenda":
        HashMap dadosCancelamento = call.argument("dadosCancelamento");
        codAtivacao = call.argument("codigoAtivacao");
        result.success(sat.cancelarVenda(numeroSessao,codAtivacao, dadosCancelamento));
        break;



    }
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {

    activity = binding.getActivity();
    sat = new ServiceSat(activity);

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivity() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

}
