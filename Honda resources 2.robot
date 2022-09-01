*** Settings ***

Library    SeleniumLibrary
Library    String


*** Variables ***
${pagina_inicial}    https://front-fi-bancohonda.stage.stefanini.io/
${empresa}    //input[contains(@id,'dealershipCode')]
${usuario}    //input[contains(@id,'user')]
${senha}    //input[contains(@id,'password')]
${continuar}    //span[@class='MuiButton-label'][contains(.,'Continuar')]
${nova_proposta}    //button[contains(@id,'proposalEntry')]
${cpf}    //input[contains(@id,'CPF')]
@{cpf_lista}    93386427049	    44773957018    	35514036006	    80198641052    	96081519023	    80485794055	    
...    80680811001	    09994603078	    85420248000	    28838269009	    37181263030	    35454140007	    10442124031
${celular}    //input[contains(@id,'cellphone')]
${ano_campo}    //input[contains(@id,'manufactureYear')]
${ano}    //li[contains(@id,'manufactureYear-option-0')]
${ano_modelo}    //li[contains(@id,'modelYear-option-1')]
${ano_modelo_campo}    //input[contains(@id,'modelYear')]
${modelo_campo}    //input[@id='model']
${modelo}    //li[contains(@id,'model-option-5')]
${valor_bem}    //input[contains(@id,'vehiclePrice')]
${valor_entrada}    //input[contains(@id,'entry')]
${continuar_dados}    //button[contains(@id,'sendButton')]
${continuar_1}    //button[contains(@id,'sendButton')]
${loading}    <div id="loadingSpinner" class="MuiBackdrop-root jss112">
${continuar_financiamento}    //span[contains(.,'Continuar')]
${elemento_simulacao}    //h5[contains(.,'Total: R$ 0,00')]
${Preencher_proposta}    //button[contains(.,'Preencher Proposta')]
${vendedor_campo}    //input[contains(@id,'seller')]
${vendedor}    //li[@id='seller-option-1']
${continuar_proposta}    //button[contains(.,'Continuar')]
${continuar_simulacao}    //span[contains(.,'Continuar')]
${salvo_com_sucesso}    //div[contains(@id,'notistack-snackbar')]
${nome_proponente}    //input[contains(@id,'name')]
@{nome_lista}    João De Deus    Maria Conceição    Ivanilda Gomes    Geovaldo Genésio    Inez Santos    Amaral Carvalho
${data_nascimento}    //input[contains(@id,'birthday')]
${naturalidade}    //input[contains(@id,'naturalness')]
${estado_civil}    //input[contains(@id,'maritalStatus')]
${documento}    //input[contains(@id,'documentType')]
${numero_documento}    //input[contains(@id,'documentNumber')]
${nome_mae}    //input[contains(@id,'mothersName')]
${nome_pai}    //input[contains(@id,'fathersName')]
${email_proponente}    //input[contains(@id,'email')]
${continuar_dados_proposta}    //button[contains(.,'Continuar')]
##dados da proposta - endereço do cliente 
${genero_masculino}    //input[contains(@id,'genderMale')]
${estado_civil_solteiro}    //li[contains(@id,'maritalStatus-option-2')]
${tipo_documento}    //li[contains(@id,'documentType-option-4')]
${cep_proponente}    //input[contains(@id,'CEP')]
${clique_endereco}    //input[contains(@id,'street')]
${carregar_cep}    //svg[contains(@class,'MuiCircularProgress-svg')]
${numero_residencia}    //input[contains(@id,'number')]
${continuar_endereco}    //span[@class='MuiButton-label'][contains(.,'Continuar')]
##dados da proposta - endereço profissional
${profissao}    //input[@id='occupation']
${profissao_opcao}    //li[contains(@id,'occupation-option-0')]
${data_profissao}    //input[contains(@id,'admissionDate')]
${renda_mensal}    //input[contains(@id,'monthlyIncome')]
${nome_empresa}    //input[contains(@id,'companyName')]
${natureza_prof}    //input[contains(@id,'occupationNature')]
${natureza_opcao}    //li[contains(@id,'occupationNature-option-4')]
${cep_empresa}    //input[contains(@id,'CEP')]
${Carregar_prof}    //svg[contains(@class,'MuiCircularProgress-svg')]
${numero_end_prof}    //input[contains(@id,'number')]
${telefone_prof}    //input[contains(@id,'phone')]
${patrimonio}    //input[contains(@id,'patrimony')]
${patrimonio_opcao}    //li[contains(@id,'patrimony-option-2')]
${escolaridade}    //input[contains(@id,'schooling')]
${escolaridade_opcao}    //li[contains(@id,'schooling-option-4')]
${continuar_profissao}    //span[@class='MuiButton-label'][contains(.,'Continuar')]
##Dados da proposta - Aceite
${aceite_proposta}    //span[@class='MuiButton-label'][contains(.,'Sim')]
${de_acordo}    //input[contains(@id,'bacenAuthorization')]
${enviar}    //span[@class='MuiButton-label'][contains(.,'Enviar')]
${salvando_proposta}    //h4[contains(@data-testid,'modalLabel')]





*** Keywords ***
Tempo para sair
Abrir o navegador
    Open Browser    browser=chrome
Navegue para o site banco honda
    Go To    ${pagina_inicial}
    Wait Until Page Contains    Login
    Maximize Browser Window
    

Preencha empresa usuario e senha
    Set Selenium Timeout    20 seconds
    Input Text    ${empresa}    **** 
    Input Text    ${usuario}    ****
    Input Password    ${senha}   ****
    Wait Until Element Is Visible    ${continuar}
    Click Element    ${continuar}
Clique em entrada de proposta
    Wait Until Page Contains    Bem vindo!
    Click Button    ${nova_proposta}
Preencha os dados básicos
    Get Selenium Timeout
    Set Selenium Timeout    20 seconds
    Wait Until Page Contains    Dados Básicos
     ${cpf_aleatorio}=    Evaluate   random.choice($cpf_lista)
    Input Text    ${cpf}    ${cpf_aleatorio}
    Input Text    ${celular}    51993622922
    Click Element    ${ano_campo}
    Wait Until Element Is Visible     ${ano}
    Click Element    ${ano}
    Click Element    ${ano_modelo_campo}
    Click Element  ${ano_modelo}
    Click Element    ${modelo_campo}
    Wait Until Element Is Visible    ${modelo}
    Click Element   ${modelo}
    input text    ${valor_bem}    13000000
    Input Text    ${valor_entrada}    8000000

Preencha os dados básicos 2
    Set Selenium Timeout    20 seconds
    Set Browser Implicit Wait    2 seconds
    Wait Until Page Does Not Contain    ${loading}
    Wait Until Element Is Visible    ${continuar_dados}
    Click Button    ${continuar_dados}

Preencha os dados da simulação
    Set Selenium Timeout    20 seconds
    Set Browser Implicit Wait    10 seconds
    Wait Until Element Is Not Visible    //h4[contains(@data-testid,'modalLabel')]
    Set Browser Implicit Wait    5 seconds
    Run Keyword And Ignore Error    Scroll Element Into View     ${elemento_simulacao} 
    Wait Until Element Is Not Visible    //h4[contains(@data-testid,'modalLabel')]
    Set Browser Implicit Wait    4 seconds
    Click Element    ${continuar_financiamento}
Preencher Proposta
    Set Browser Implicit Wait    5 seconds
      Wait Until Element Is Visible    ${Preencher_proposta}
    Click Button    ${Preencher_proposta}
Dados da proposta - pré análise
    Set Selenium Timeout    20 seconds
    Wait Until Page Contains    Ficha Proposta
    Click Element    ${vendedor_campo}
    Wait Until Element Is Visible    ${vendedor}
    Click Element    ${vendedor}
    Set Browser Implicit Wait    2 seconds
    Click Button    ${continuar_proposta}
Dados da proposta - simulador
    Set Selenium Timeout    20 seconds
    Set Browser Implicit Wait    5 seconds
    Wait Until Page Contains    Ficha Proposta
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Run Keyword And Ignore Error    Scroll Element Into View    ${continuar_simulacao} 
    Wait Until Element Is Visible    ${continuar_simulacao} 
    Set Browser Implicit Wait    2 seconds
    Click Element    ${continuar_simulacao} 

Dados da proposta - Dados do cliente
    Set Selenium Timeout    20 seconds
    Wait Until Page Contains    Dados Pessoais
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Set Browser Implicit Wait    5 seconds
    ${nome_aleatório}=    Evaluate   random.choice($nome_lista)
    Input Text    ${nome_proponente}   ${nome_aleatório}
    Input Text    ${data_nascimento}    01021980
    Input Text    ${naturalidade}    Brasileiro(a)
    Click Element    ${genero_masculino}
    Click Element    ${estado_civil}
    Click Element    ${estado_civil_solteiro}
    Click Element    ${documento}
    Click Element    ${tipo_documento}
    ${numero_aleatorio}=    Generate Random String    length=6    chars=[NUMBERS]
    Input Text    ${numero_documento}   ${numero_aleatorio} 
    Input Text    ${nome_mae}     Mãe Do Proponente
    Input Text    ${nome_pai}     Pai Do Proponente
    Input Text    ${email_proponente}    vinicius.fava@qintess.com
    Run Keyword And Ignore Error    Scroll Element Into View    ${continuar_dados_proposta}
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Set Browser Implicit Wait    2 seconds
    Click Button    ${continuar_dados_proposta}

Dados da proposta - Endereço do cliente
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Set Browser Implicit Wait    2 seconds
    Input Text    ${cep_proponente}    94852370
    Click Element    ${clique_endereco}
    Set Browser Implicit Wait    2 seconds
    Wait Until Element Is Not Visible    ${carregar_cep}
    Wait Until Element Is Not Visible    //svg[@class='MuiCircularProgress-svg']
    
    ###${num_res}=    Generate Random String    lenght=6    chars=[NUMBERS]
    Input Text    ${numero_residencia}    545
    Click Element    ${continuar_endereco}

Dados da proposta - Endereço profissional
    Set Selenium Timeout    20 seconds
    Wait Until Page Contains    Ficha Proposta
    Click Element    ${profissao}
    Click Element    ${profissao_opcao}
    Input Text    ${data_profissao}    01052000
    Input Text    ${renda_mensal}    1000000
    Input Text    ${nome_empresa}    Empresa De Teste
    Click Element    ${natureza_prof}
    Click Element    ${natureza_opcao}
    Input Text    ${cep_empresa}    94852160
    Click Element    ${numero_end_prof}
    Wait Until Element Is Not Visible    ${Carregar_prof}
    Input Text    ${numero_end_prof}    555
    Input Text    ${telefone_prof}     51993622922
    Run Keyword And Ignore Error    Scroll Element Into View    ${continuar_profissao}
    Set Browser Implicit Wait    2 seconds
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Click Element    ${patrimonio} 
    Click Element    ${patrimonio_opcao} 
    Click Element    ${escolaridade}
    Click Element    ${escolaridade_opcao}
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Set Browser Implicit Wait    2 second
    Click Element    ${continuar_profissao}

Dados da proposta - Aceite
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Not Visible    ${salvo_com_sucesso}
    Click Element    ${aceite_proposta}
    Click Element    ${de_acordo}
    Wait Until Element Is Visible    ${enviar}
    Click Element    ${enviar}
    Wait Until Element Is Not Visible    ${salvando_proposta}
    ##Capture Page Screenshot
    Close Browser
##Executar de novo
    ##Return From Keyword   Clique em entrada de proposta










    
    




