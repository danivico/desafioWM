# frozen_string_literal: true

class ResultPage
  include Capybara::DSL
  def go
    visit '/carros/estoque?idcmpint=t1:c17:m07:webmotors:busca::verofertas'
  end

  def busca(carro)
    expect(page).to have_css('h2', text: carro.upcase)
  end

  def versao
    versao = find('div.Filters__make-block > div:nth-of-type(2) > div:nth-of-type(3)')
    versao.click
    sleep 2
  end

  def primeiraversao
    primeira = first('.Filters__line__result')
    sleep 2
    primeira.click
  end

  def vendor(vendedor)
    case vendedor
    when "Concessionária"
      within('.NavBar') do
        testando = find(:xpath, '/html/body/div[2]/main/div[1]/div[2]/div/div[5]/div[2]/label', visible: false)
        execute_script('arguments[0].scrollIntoView(true)', testando)
        testando.click
      end
    when 'Loja'
      within('.NavBar') do
        testando = find(:xpath, '/html/body/div[2]/main/div[1]/div[2]/div/div[5]/div[3]/label', visible: false)
        execute_script('arguments[0].scrollIntoView(true)', testando)
        testando.click
      end
    when "Pessoa física"
      within('.NavBar') do
        testando = find(:xpath, '/html/body/div[2]/main/div[1]/div[2]/div/div[5]/div[4]/label', visible: false)
        execute_script('arguments[0].scrollIntoView(true)', testando)
        testando.click
      end
    else
      "Vendedor Inv\xC3\xA1lido"
    end
  end
end
