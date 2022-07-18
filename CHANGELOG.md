## 0.0.1

* Primeiro commit com os principais métodos 
| Metodo | Entrada | Descrição |
| ------ | ------ |-----|
|deviceInfo|void|Pegar o modelo do sat conectado|
|ativarSAT|número de sessão, Map[subcomando (1 ou 2 ), cnpj , codUf]| Ativa o sat para uso|
associarAssinatura| número de sessão , Map[codigo de ativação,concatenação do cnpj + cnpj da software house , assinatura AC]|Associa a assinaturada sofware house|
|consultarSAT|número de sessão|Retorna o status do sat|
statusOperacional|número de sessão,codigo de ativação|Retorna um objeto do status operacional|
|extrairLog|número de sessão,código de ativação|Retorna um objeto do log completo do sat|
|enviarVenda| número de sessão,código de ativação,xml| Envia a venda e retorna um objeto da venda|
|cancelarVenda|número de sessão,código de ativação, Map[chave,xml de cancelamento]|Cancela a nota de acordo com os parâmetros acima|
|atualizarSoftwareSat|número de sessão,código de ativação|Faz a atualização do software base do sat|
|consultarNumeroSessao|número de sessão,código de ativação,número de sessão para consulta|Consulta a resposta de um número de sessão específico|
|bloquearSat|número de sessão,código de ativação|Faz o bloqueio manual do sat|
|desbloquearSat|número de sessão,código de ativação| Faz o deslobloqueio manual do sat quando possível
|testeFimAFim|número de sessão,código de ativação,xml|Faz um teste de fim a fim no sat com base no xml enviado|
|configurarInterfaceDeRede|número de sessão,código de ativação,dados|Configura a rede, DHCP ou ip fixo de acordo com as configurações|
|trocarCodigoDeAtivacao|número de sessão,metodo de troca , código de ativação,código novo, confirmação do código|Troca o código de ativação, dependendo do método de troca, utilizando a senha emergencial ou a senha anterior do aparelho|
