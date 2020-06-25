#language: pt
Funcionalidade: Pesquisar carro na pagina de pesquisa
  Eu como um usuário na página de resultados de busca
  Quero pesquisar um carro por Marca, Modelo e Versão
  Para poder comprar

  Contexto:
    Dado que estou na página de busca

  @lateral
  Cenario: Barra lateral
    Quando eu selecionar marca "Honda" na barra lateral
      E modelo "City"
    Então devo ver o resultado da busca realizada

  @lateralv
  Cenario: Barra lateral com versão
    Quando eu selecionar marca "Honda" na barra lateral
      E modelo "City"
      E uma versão
    Então devo ver o resultado da busca realizada

  @lateralLoja
  Cenario: Estoque de loja
    Quando eu selecionar marca "Honda" na barra lateral
      E modelo "City"
    Quando marcar a opção "Loja"
    Então devo ver lojas com estoque