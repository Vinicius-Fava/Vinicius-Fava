*** Settings ***
Documentation        This suite is for testing websites described for IQVIA interview
Resource            IQVIA_resources.robot
Test Setup           Open Browser to navigate
#Test Teardown        Close Browser

*** Test Cases ***
As an user, i want to create a new administrator account in the system    
    [Documentation]    First test case of severest website
    1 - As an user, go to the website severest
    2 - Click on the option "Cadastre-se"
    3 - click on the "Digite seu nome" field and Inform a name
    4 - click on the "Digite seu email" field and inform a valid email address
    5 - Click on "Digite sua senha" field and inform a valid password
    6 - Mark the "Cadastrar como administrador" checkbox
    7 - Click on "Cadastrar" 

As an user, i want to add a new item in the store
    [Documentation]    Second test case of serverest website
    1 - go to the website severest
    2 - Fill the field with your email and password and click on "entrar"
    3 - Inside the system, click on "cadastrar produtos"
    4 - Fill the required fields: "Nome, preço, descrição e quantidade"
    5 - Click on "Cadastrar" and wait for the page to reload

