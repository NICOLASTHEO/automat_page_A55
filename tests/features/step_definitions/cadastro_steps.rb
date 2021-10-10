Dado('que acesso a pagina de cadastro') do
    visit "https://plataforma.a55.tech/parceiro?utm_source=integracao&utm_medium=parceiro_integracao&utm_campaign=unbox&utm_content=lp"
end

Quando('faço meu cadastro com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |nome_completo, email, celular, cargo, cnpj, criar_senha, receita, valor_emprestimo, check_box|
    find('input[placeholder="Nome completo"]').set nome_completo
    find('input[placeholder="Email"]').set email
    find('input[placeholder="Celular"]').set celular
    find('input[placeholder="Cargo"]').set cargo
    find('input[placeholder="CNPJ"]').set cnpj
    find('input[placeholder="Criar senha para acesso a plataforma a55"]').set criar_senha
    find('input[placeholder="Receita média dos últimos 3 meses"]').set receita
    find('input[placeholder="Valor do empréstimo solicitado"]').set valor_emprestimo
    find("span[class='el-checkbox__inner']").set check_box
    
    click_button "COMEÇAR MEU CRESCIMENTO"
end

Então('devo ser autentiacdo com sucesso') do
    expect(page).to have_content "Voltar ao site"
end

Então('vejo a mensagem {string}') do |mensagem|
    expect(page).to have_content mensagem
end

Quando('faço meu cadastro deixando campos em branco') do
    click_button "COMEÇAR MEU CRESCIMENTO"
end

Quando('faço meu cadastro com pelo menos o primeiro campo preenchido {string}') do |nome_completo|
    find('input[placeholder="Nome completo"]').set nome_completo
end
  
Quando('não marco o checkbox') do
    click_button "COMEÇAR MEU CRESCIMENTO"
end