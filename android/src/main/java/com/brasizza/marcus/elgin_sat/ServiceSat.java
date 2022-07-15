package com.brasizza.marcus.elgin_sat;

import android.content.Context;
import android.widget.Toast;

import java.util.Map;
import java.util.Optional;
import java.util.Random;

import br.com.elgin.DeviceInfo;
import br.com.elgin.Sat;
import br.com.elgin.SatInitializer;

public class ServiceSat {
    public static SatInitializer satInitializer;
    private Context contextSat;

    public ServiceSat(Context context) {
        satInitializer = new SatInitializer();
        contextSat = context;

    }

    public String ativarSAT(int numSessao, Map map) {
        String retorno = "...";
        int subComando = (int) map.get("subComando");
        String codeAtivacao = (String) map.get("codAtivacao");
        String cnpj = (String) map.get("cnpj");
        int cUF = (int) map.get("cUF");
        retorno = Sat.ativarSat(numSessao, subComando, codeAtivacao, cnpj, cUF);

        return retorno;
    }

    public String associarAssinatura(int numSessao, Map map) {
        String retorno = "...";

        String codeAtivacao = (String) map.get("codAtivacao");
        String cnpjSh = (String) map.get("cnpjSh");
        String assinaturaAC = (String) map.get("assinaturaAC");
        retorno = Sat.associarAssinatura(numSessao, codeAtivacao, cnpjSh, assinaturaAC);

        return retorno;
    }

    public String consultarSAT(int numSessao) {
        String result = "...";
        result = Sat.consultarSat(numSessao);
        return result;
    }

    public String statusOperacional(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.consultarStatusOperacional(numSessao, codAtivacao);
        return retorno;
    }

    public String enviarVenda(int numSessao, String codAtivacao, String xml) {
        String retorno = "...";
        retorno = Sat.enviarDadosVenda(numSessao, codAtivacao, xml);
        return retorno;
    }

    public String cancelarVenda(int numSessao, String codAtivacao, Map map) {
        String retorno = "...";
        String cFeCancelar = (String) map.get("cFeCancelar");
        String xmlCancelamento = (String) map.get("xmlCancelamento");
        retorno = Sat.cancelarUltimaVenda(numSessao, codAtivacao, cFeCancelar, xmlCancelamento);
        return retorno;
    }


    public String deviceInfo() {
        Optional<DeviceInfo> deviceInfo = Sat.getDeviceInfo();
        if (deviceInfo != null) {
            return deviceInfo.get().asJson();
        }
        return "";
    }

    public String extrairLog(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.extrairLogs(numSessao, codAtivacao);
        return retorno;
    }

    public String atualizarSoftwareSat(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.atualizarSoftwareSat(numSessao, codAtivacao);
        return retorno;

    }

    public String consultarNumeroSessao(int numSessao, String codAtivacao, int sessaoConsultar) {
        String retorno = "...";
        retorno = Sat.consultarNumeroSessao(numSessao, codAtivacao, sessaoConsultar);
        return retorno;

    }


    public String bloquearSat(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.bloquearSat(numSessao, codAtivacao);
        return retorno;
    }


    public String desbloquearSat(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.desbloquearSat(numSessao, codAtivacao);
        return retorno;
    }

    public String testeFimAFim(int numSessao, String codAtivacao, String xml) {
        String retorno = "...";
        retorno = Sat.testeFimAFim(numSessao, codAtivacao, xml);
        return retorno;
    }

    public String configurarInterfaceDeRede(int numSessao, String codAtivacao, String dadosRede) {
        String retorno = "...";
        retorno = Sat.configurarInterfaceDeRede(numSessao, codAtivacao, dadosRede);
        return retorno;
    }


    public String trocarCodigoDeAtivacao(int numSessao, String codAtivacao, Map map) {
        String codAtivacaoNovo = (String) map.get("codAtivacaoNovo");
        String confirmaCodNovo = (String) map.get("confirmaCodNovo");
        int metodoTroca = (int) map.get("metodoTroca");
        String retorno = "...";
        retorno = Sat.trocarCodigoDeAtivacao(numSessao, codAtivacao, metodoTroca, codAtivacaoNovo, confirmaCodNovo);
        return retorno;
    }

    public String consultarUltimaSessaoFiscal(int numSessao, String codAtivacao) {
        String retorno = "...";
        retorno = Sat.consultarUltimaSessaoFiscal(numSessao, codAtivacao);
        return retorno;
    }



}