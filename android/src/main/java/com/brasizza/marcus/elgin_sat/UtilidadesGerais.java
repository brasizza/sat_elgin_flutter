package com.brasizza.marcus.elgin_sat;

import java.util.Random;

public class UtilidadesGerais {

    public static int gerarNumeroSessao() {

        Random random = new Random();
        int numeroSessao = random.nextInt(999999);

        return numeroSessao;
    }
}
