# SAT BEMATECH/ELGIN

> 🚧  Este package inicialmente funciona somente em Android. 🚧 

Esse package te ajudou? Me ajude a manter o projeto ativo. ⬇️

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?business=5BMWJ9CYNVDAE&no_recurring=0&currency_code=BRL)

## Testes
Este package foi testado nos seguintes SATs: 

Aparelho SAT | Android |
:----------: | :-----: |
[SMART SAT](https://www.elgin.com.br/Produtos/automacao/sat-mfe/smart-sat) | 10 e 11 |
[SAT@GO](https://www.bematech.com.br/produto/rb-2000) | 10 e 11 |

## Configurando o package | IMPORTANTE ⚠
Como se trata de um compomente que se comunica com libs externas, serão necessários fazer algumas (pouquíssimas) modificações na sua pasta **`android`**.

1. Na sua pasta `android/app`, mude o seu **minSdkVersion para 21**, pois os componentes da Elgin utilizam uma dependência que é necessário subir a versão.

2. Baixar a última versão do sdk que estiver [SDK SAT](https://github.com/ElginDeveloperCommunity/SAT/tree/master/Elgin/SMART%20SAT/Biblioteca%20Android). 
    - No momento, a versão das libs está em *8.0.1*, funcionando tanto nos SAT da Elgin quanto da Bematech.

3. Ir no seu projeto, na pasta `android/app` e criar uma pasta chamada libs e adicionar o arquivo `.aar`.

4. Ainda dentro da pasta `app`, iremos precisar modificar o `build.gradle`, pois como ele utiliza libs externas, também precisamos incluir no nosso package.<br>No final do seu **`android/app/build.gradle`** , você irá colocar a seguinte informação (indicando a leitura dos métodos do SDK).

    ```gradle
    dependencies {
        implementation fileTree(dir: 'libs', include: ['*.aar'])
    }
    ```

5. Depois disso você terá que fazer pequenas modificações no **AndroidManifest** (`android/app/src/main/AndroidManifest.xml`).

    -  A primeira  modificação será incluir o `uses-feature` para permitir que o USB do seu device seja utilizado, entre o fechamento do manifest e o começo do **`<application`**:

    ```xml
    <uses-feature android:name="android.hardware.usb.host" />
    ```

    - Dentro da sua `activity`, você deverá informar um `intent-filter` para o USB:

    ```xml
    <intent-filter>
        <action android:name="android.hardware.usb.action.USB_DEVICE_ATTACHED" />
    </intent-filter>
    ```

    - Abaixo do fechamento do `activity`, um service indicando que o método de USB da lib Elgin será acionado:

    ```xml
    <service android:name="br.com.elgin.sat.USBService" android:enabled="true" />
    ```

    > ✔️ [Aqui possui um exemplo de como o seu **AndroidManifest** deverá ficar.](https://gist.github.com/brasizza/c38d36aa9fd312f6996b03061c731bd1) ✔️️

# Métodos Implementados

| Método | Entrada | Descrição |
| ------ | ------- | --------- |
|deviceInfo | void | Pegar o modelo do SAT conectado|
|ativarSAT | número de sessão, Map[subcomando (1 ou 2 ), cnpj, codUf] | Ativa o SAT para uso|
|associarAssinatura | número de sessão, Map[codigo de ativação,concatenação do cnpj + cnpj da software house, | assinatura AC | Associa a assinaturada sofware house |
|consultarSAT | número de sessão | Retorna o status do SAT |
|statusOperacional | número de sessão, código de ativação | Retorna um objeto do status operacional |
|extrairLog | número de sessão, código de ativação | Retorna um objeto do log completo do SAT |
|enviarVenda | número de sessão, código de ativação, xml | Envia a venda e retorna um objeto da venda |
|cancelarVenda | número de sessão, código de ativação, Map[chave,xml de cancelamento] | Cancela a nota de acordo com os parâmetros acima |
|bloquearSat | número de sessão, código de ativação | Faz o bloqueio manual do SAT |
|desbloquearSat | número de sessão, código de ativação | Faz o desbloqueio manual do SAT quando possível | testeFimAFim | número de sessão, código de ativação, xml | Faz um teste de fim a fim no SAT com base no xml enviado |
|consultarNumeroSessao | número de sessão, código de ativação, número de sessão para consulta | Consulta a resposta de um número de sessão específico |
|atualizarSoftwareSat | número de sessão, código de ativação | Faz a atualização do software base do SAT |


# ⌛ Não implementados ainda

| Método | Entrada | Descrição |
| ------ | ------- | --------- |
|trocarCodigoDeAtivacao | número de sessão, método de troca, código de ativação, código novo, confirmação do código | Troca o código de ativação, dependendo do método de troca, utilizando a senha emergencial ou a senha anterior do aparelho |
|configurarInterfaceDeRede | número de sessão, código de ativação, dados | Configura a rede, DHCP ou IP fixo de acordo com as configurações |
comunicarCertificadoIcpbrasil | número de sessão, código de ativação, certificado | Associa o SAT com o certificado do ICP BRASIL |

