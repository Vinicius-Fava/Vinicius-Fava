*** Settings ***

Resource    Honda resources 2.robot
Library    SeleniumLibrary
Test Setup    Abrir o navegador

*** Test Cases ***
Massa de dados para financiamento
    [Documentation]    Para criar massas de dados de propostas
    Navegue para o site banco honda
    Preencha empresa usuario e senha
    Clique em entrada de proposta
    Preencha os dados básicos
    Preencha os dados básicos 2
    Preencha os dados da simulação
    Preencher Proposta
    Dados da proposta - pré análise
    Dados da proposta - simulador
    Dados da proposta - Dados do cliente
    Dados da proposta - Endereço do cliente
    Dados da proposta - Endereço profissional
    Dados da proposta - Aceite
    