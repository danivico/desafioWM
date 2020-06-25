class InicialPage
  include Capybara::DSL
  def go
    visit '/'
  end
  
  def teclas
    teclas = %i[tab enter]
    teclas.each do |t|
      find('.SearchBar__results__result').send_keys t
    end
  end
end