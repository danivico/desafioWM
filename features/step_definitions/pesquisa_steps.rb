# frozen_string_literal: true

Dado("que estou na p\xC3\xA1gina de busca") do
  @resultado.go
  sleep 35 # apenas para nao ter acesso bloqueado
end

Quando('eu selecionar marca {string} na barra lateral') do |marca|
  card = find(".CardMake[title=#{marca.downcase}]")
  card.click
  $mac = marca
end

Quando('modelo {string}') do |modelo|
  modelos = find('.Filters__make-block', text: 'Todos os modelos')
  modelos.click
  modelo = modelo.upcase
  $mol = modelo
  escolha = find("a[href='https://www.webmotors.com.br/carros/estoque/honda/city']")
  escolha.click
  sleep 3
end

Quando("uma vers\xC3\xA3o") do
  @resultado.versao
  primeira = first('.Filters__line__result')
  primeira.click
  $ver = primeira.text
  puts primeira.text
end

Então('devo ver o resultado da busca realizada') do
  expect(page).to have_css('h2', text: $mac.concat(32, $mol).upcase, match: :first)
  expect(page).to have_css('h3', text: $ver, match: :first)
end

Quando("marcar a op\xC3\xA7\xC3\xA3o {string}") do |vendedor|
  @resultado.vendor(vendedor)
end
Então('devo ver lojas com estoque') do
  expect(page).to have_css('.FoundCars')
end