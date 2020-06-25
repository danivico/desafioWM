  Dado('que estou na página incial') do
    @inicial.go
    sleep 35 # apenas para não ter acesso bloqueado
  end
  Quando('eu pesquisar por {string} e {string}') do |marca, modelo|
    $mac = marca
    $mol = modelo
    find('#searchBar').set marca.concat(32, modelo)
  end
  Quando('selecionar o modelo sugerido') do
    @inicial.teclas
  end
  Então('devo ver o resultado da busca') do
    expect(page).to have_css('h2', :text => $mac.upcase)
  end
  Então('deve estar selecionado {string} e {string} na barra lateral') do |marca, modelo|
    texto = find('.Filters__make-block')
    expect(texto).to have_content(marca.upcase.concat(32, modelo.upcase, 32, 'Todas as versões'))
  end