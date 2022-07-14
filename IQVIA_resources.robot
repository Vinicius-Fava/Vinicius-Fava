*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#variables for severest
${URL}    https://front.serverest.dev/login
${cadastre-se}    //a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${email_field}    //input[contains(@data-testid,'email')]
${Nome}    //input[contains(@data-testid,'nome')]
${senha}    //input[contains(@data-testid,'password')]
${admin_checkbox}    //input[contains(@name,'administrador')]
${Cadastrar}    //button[contains(@data-testid,'cadastrar')]
${login}    //button[contains(@data-testid,'entrar')]
${cadastrar_produto}    //a[@data-testid='cadastrar-produtos'][contains(.,'Cadastrar Produtos')]
${nome_produto}    //input[contains(@data-testid,'nome')]
${preco_produto}    //input[contains(@data-testid,'preco')]
${descricao_produto}    //textarea[contains(@data-testid,'descricao')]
${qtde_produto}    //input[contains(@data-testid,'quantity')]
${include_product}    //button[contains(@data-testid,'cadastarProdutos')]
${senha_login}    //input[contains(@data-testid,'senha')]
${url_cadastrar_prod}    https://front.serverest.dev/admin/cadastrarprodutos

#variables for saucedemo
${saucedemo_url}    https://www.saucedemo.com/
${saucedemo_username}    //input[contains(@id,'user-name')]
${saucedemo_password}    //input[contains(@id,'password')]
${saucedemo_login}    //input[contains(@id,'login-button')]
${saucedemo_sort}    //select[contains(@class,'product_sort_container')]
${saucedemo_lohi}    //option[@value='lohi'][contains(.,'Price (low to high)')]
${saucedemo_inventory_list}    //div[contains(@class,'inventory_list')]

#variables for applitools
${applitools_url}     https://demo.applitools.com
${applitools_username}    //input[contains(@id,'username')]
${applitools_sign_in}    //a[@class='btn btn-primary'][contains(.,'Sign in')]
${applitools_search}    (//input[contains(@placeholder,'Start typing to search...')])[1]
${applitools_pwd}    //input[contains(@id,'password')]
${applitools_avatar}    (//img[@src='img/avatar1.jpg'])[2]
*** Keywords ***
#keywords for severest tests
#Close Browser
   # Close Browser
Open Browser to navigate
    Open Browser    browser=chrome
    Maximize Browser Window
1 - As an user, go to the website severest
    Go To   url=${URL}
    Wait Until Page Contains    text=Cadastre-se

2 - Click on the option "Cadastre-se"
     Click Link    locator=${cadastre-se}
     Wait Until Element Is Visible    locator=${Nome}

3 - click on the "Digite seu nome" field and Inform a name
    Input Text    locator=${Nome}   text=Vinicius

4 - click on the "Digite seu email" field and inform a valid email address
     Input Text    locator=${email_field}    text=viniciusfava.adv@gmail.com

5 - Click on "Digite sua senha" field and inform a valid password
    Input Password    locator=${senha}   password=123456
    #Wait Until Page Contains    text=cadastro

6 - Mark the "Cadastrar como administrador" checkbox
   Select Checkbox    locator=${admin_checkbox}

7 - Click on "Cadastrar" 
     Click Element    locator=${Cadastrar}

1 - go to the website severest
      Go To   url=${URL}
    Wait Until Page Contains    text=Cadastre-se

2 - Fill the field with your email and password and click on "entrar"
    Input Text    locator=${email_field}    text=viniciusfava.adv@gmail.com
    Input Password    locator=${senha_login}   password=123456
    Click Button    locator=${login}
    Wait Until Page Contains    text=Logout
    
3 - Inside the system, click on "cadastrar produtos"
    Go To     url=${url_cadastrar_prod}  #locator=${cadastrar_produto}
    Wait Until Page Contains    text=Logout

4 - Fill the required fields: "Nome, preço, descrição e quantidade"
    Input Text    locator=${nome_produto}    text=mochila
    Input Text    locator=${preco_produto}  text=150
    Input Text    locator=${descricao_produto}  text=mochila oakley
    Input Text    locator=${qtde_produto}    text=40

5 - Click on "Cadastrar" and wait for the page to reload
    Click Button    locator=${include_product}

#Keywords for saucedemo
1 - As an user, go to the website Saucedemo.com
    Go To    url=${saucedemo_url}
    Wait Until Page Contains    text=Accepted

 2 - Go to the username field and fill with an user
     Input Text    locator=${saucedemo_username}    text=viniciusfava

3 - Go to the password field and fill with a wrong password
    Input Password    locator=${saucedemo_password}    password=32421

4 - Click on the Login button
    Click Button    locator=${saucedemo_login}

1 - As an user, go to the saucedemo website
        Go To    url=${saucedemo_url}
    Wait Until Page Contains    text=Accepted

2 - Inform a valid username and password and click on login
    Input Text    locator=${saucedemo_username}   text=standard_user
    Input Password    locator=${saucedemo_password}    password=secret_sauce
    Click Button    locator=${saucedemo_login}
    Wait Until Page Contains    text=2022

3 - Click on the filter option on the top right corner of the screen and select price (low to high)
    Click Element    locator=//div[contains(@class,'inventory_list')]
    Wait Until Page Contains    text=Price
    Click Element    locator=${saucedemo_lohi}

 4 - Scroll down and up to verify that the items are displayed from the lowest to the highest price.
     Scroll Element Into View    locator=${saucedemo_inventory_list}

#keywords for applitools

1 - Go to the website applitools
     Go To    url=${applitools_url}
     Wait Until Page Contains    text=Sign in

2 - Perform a login with an username/password clicking on sign in.
    Input Text    locator=${applitools_username}   text=viniciusfava
    Input Password    locator=${applitools_pwd}    password=3453425
    Go to   url=https://demo.applitools.com/app.html
    
3 - Go to the search bar in the top right of the screen, click on it and type anything
    Input Text    locator=${applitools_search}    text=Ebay
4 - The results must be displayed while typing, without any further action
    Wait Until Page Contains    text=Ebay
    #this step cannot be fully reproduced in the website.
    

1 - Go to https://demo.applitools.com/
    Go To    url=${applitools_url}
     Wait Until Page Contains    text=Sign in

2 - inform an username, password and click on sign in
     Input Text    locator=${applitools_username}   text=viniciusfava
    Input Password    locator=${applitools_pwd}    password=3453425
    Go to   url=https://demo.applitools.com/app.html
3 - Go to the top right of the screen and click on the image
    Click Image    locator=${applitools_avatar}
    