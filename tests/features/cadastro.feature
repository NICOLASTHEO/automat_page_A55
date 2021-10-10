#language: pt

Funcionalidade: Cadastro
    Para que eu possa solicitar crédito
    Devo cadastrar-me previamente.
    Sendo que para sucesso no Cadastro deve-se informar Nome Completo, Email não cadastrado anteriormente, Celular, Cargo, CNPJ inexistente na base de dados, Criar senha para acesso a plataforma a55, Informar a Receita média dos últimos 3 meses, Valor do empréstimo solicitado.
    Devendo aceitar as políticas de privacidade.
    Clicar em COMEÇAR MEU CRESCIMENTO, sendo o cadastro confirmado
    Será enviado uma mensagem ao email informado.
    Na próxima página deve-se ler a mensagem: Cadastro finalizado com sucesso, agora confira seu email

    Contexto: Página de Cadastro
        Dado que acesso a pagina de cadastro

    Cenário: Cadastro de usuário
        Quando faço meu cadastro com "Nome Sobrenome", "souqualqueremail01@gmail.com", "11988776655", "um cargo", "03.326.815/0001-53", "senhamais8Dig", "10000.00", "100000.00", "checkbox"
		Então devo ser autentiacdo com sucesso
		E vejo a mensagem "Cadastro finalizado com sucesso, agora confira seu email"
    
    Esquema do Cenário: Não deve cadastrar
        Quando faço meu cadastro com "<nome>", "<email>", "<celular>", "<cargo>", "<cnpj>", "<senha>", "<renda>", "<emprestimo>", "<checkbox>"
        Então vejo a mensagem "<alerta>"

        Exemplos:
        |nome              |email                         |celular     |cargo    |cnpj               |senha         |renda    |emprestimo  |checkbox |alerta                                              |
        |Nome              |souqualqueremail01@gmail.com  |11988776655 |um cargo |03.326.815/0001-53 |senhamais8Dig |10000.00 |100000.00   |checkbox |Preencha ao menos um sobremone.                     |
        |Nome Sobrenome 1! |souqualqueremail01@gmail.com  |11988776655 |um cargo |04.588.596/0001-43 |senhamais8Dig |10000.00 |100000.00   |checkbox |O email informado já está em uso.                   |
        |Nome Sobrenome    |*_naosouumemail.com           |11988776655 |um cargo |04.588.596/0001-43 |senhamais8Dig |10000.00 |100000.00   |checkbox |Verifique o email informado                         |
        |Nome Sobrenome    |souqualqueremail01@gmail.com  |11988       |um cargo |04.588.596/0001-43 |senhamais8Dig |10000.00 |100000.00   |checkbox |Telefone inválido                                   |
        |Nome Sobrenome    |souqualqueremail02@gmail.com  |11988776655 |123!@#   |04.588.596/0001-43 |senhamais8Dig |10000.00 |100000.00   |checkbox |Erro Cargo                                          |
        |Nome Sobrenome    |souqualqueremail02@gmail.com  |11988776655 |um cargo |04.542.610         |senhamais8Dig |10000.00 |100000.00   |checkbox |CNPJ inválido, por favor verifique se está correto. |
        |Nome Sobrenome    |souqualqueremail03@gmail.com  |11988776655 |um cargo |04.588.596/0001-43 |senhamais8Dig |10000.00 |100000.00   |checkbox |O CNPJ informado já está em uso.                    |
        |Nome Sobrenome    |souqualqueremail03@gmail.com  |11988776655 |um cargo |04.588.596/0001-43 |so6dig        |10000.00 |100000.00   |checkbox |A senha deve possuir por pelos menos 8 caracteres.  |
        |Nome Sobrenome    |souqualqueremail04@gmail.com  |11988776655 |um cargo |84.306.497/0001-60 | -sou 1_ erro |10000.00 |100000.00   |checkbox |Senha inválida, não deve possuir espaços            |
         
    Esquema do Cenário:
        Quando faço meu cadastro deixando campos em branco
        Então vejo a mensagem "<alerta>"

        Exemplos:
        |              |alerta                    |
        |              |Esse campo é obrigatório. |
  
    Esquema do Cenário:
        Quando faço meu cadastro com pelo menos o primeiro campo preenchido "<nome sobrenome>"
        E não marco o checkbox
        Então vejo a mensagem "<alerta>"

        Exemplos:
        |nome sobrenome   |alerta                                |
        |Nome completo    |Favor aceitar os termos de uso.       |