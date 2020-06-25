#language: pt
Funcionalidade: Pesquisar carro na pagina inicial
    Eu como um usuário na página inicial
    Quero pesquisar um carro por Marca, Modelo e Versão
    Para poder comprar

    @campo_pesquisa
    Cenario: Campo pesquisar
        Dado que estou na página incial
        Quando eu pesquisar por "Honda" e "City"
        E selecionar o modelo sugerido
        Então devo ver o resultado da busca
        E deve estar selecionado "Honda" e "City" na barra lateral

