*** Settings ***
Documentation   Essa suite testa o site da Amazon.com.br
Library         SeleniumLibrary
Test Setup      Abrir o navegador
# Test Teardown   Fechar o navegador

*** Variables ***
${URL}                                  https://www.amazon.com.br/ 
${LIVROS}                               //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}                        //h2[contains(.,'Loja de Livros')]
${NOME_CATEGORIA}                       //img[contains(@alt,'Mais vendidos')]
${MAIS VENDIDOS}                        //img[contains(@alt,'Mais vendidos')]
${BUSCA}                                twotabsearchtextbox 
${BOTÃO}                                nav-search-submit-button
${IMAGEM}                               //img[@alt='Vai dar tudo certo']
${ADICIONAR}                            add-to-cart-button
${CARRINHO}                             nav-cart
${FECHAR_PEDIDO}                        proceedToRetailCheckout
${EMAIL}                                //input[@type='email'][contains(@id,'email')]

*** Keywords ***
Abrir o navegador
    Open Browser                         browser=chrome
    Maximize Browser Window
        
Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                                 url=${URL} 
    Wait Until Element Is Visible         locator=${LIVROS} 
    Capture Page Screenshot 

Entrar no menu "Livros"
    Click Element                         locator=${LIVROS} 
    
    
Verificar se aparece a frase "${TEXTO}"
    Wait Until Page Contains              text=${TEXTO}  
    Wait Until Element Is Visible         locator=${HEADER_LIVROS}
   
    

Verificar se o título da página fica "${TITULO_PAGE}"
    Title Should Be                       title=${TITULO_PAGE}
    

Verificar se aparece a categoria "Mais vendidos"
    Element Should Be Visible             locator=${NOME_CATEGORIA}
    Wait Until Element Is Visible         locator=${NOME_CATEGORIA}
    Capture Page Screenshot

Clicar em "Mais vendidos"
    Click Element                         locator=${MAIS VENDIDOS}  
    Capture Page Screenshot

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                            locator=${BUSCA}    text=${PRODUTO}
    Capture Page Screenshot
Clicar no botão de pesquisa
    Click Element                         locator=${BOTÃO}
    Capture Page Screenshot

Clicar na Imagem
    Click Element                         locator=${IMAGEM} 
    Capture Page Screenshot

Adicinar o Livro no Carrinho
    Click Button                          locator=${ADICIONAR}
    Capture Page Screenshot

Verificar o carrinho
    Click Element                         locator=${CARRINHO} 
    Capture Page Screenshot
Fechar o Pedido
    Click Button                          locator=${FECHAR_PEDIDO}    
    Sleep    5
    Capture Page Screenshot

Digitar o email "${EMAIL2}"
    Input Text                            locator=${EMAIL}       text=${EMAIL2}
    Capture Page Screenshot


*** Test Cases ***
Caso de Teste - Acesso ao menu "Livros" e efetuar a compra do livro
    [Documentation]    Esse teste verifica o menu Livros do site da Amazon.com.br
    ...                e verifica a categoria Mias vendidos
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Mais vendidos"
    Clicar em "Mais vendidos"
    Digitar o nome de produto "Vai dar tudo certo" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar na Imagem
    Adicinar o Livro no Carrinho
    Verificar o carrinho
    Fechar o Pedido
    Digitar o email "teste@compraamazon.com.br"
