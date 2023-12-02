Feature: Cadastrar forma de pagamento

    As a usuário
    I want to cadastrar formas de pagamento
    so that eu posso adicionar formas de pagamento ao meu perfil

    Scenario: Cadastrar forma de pagamento (limite de formas de pagamento não atingido)
	    Given eu estou logado como usuário "Henrique"
	    And eu estou na página "Formas de pagamento"
	    And eu vejo que não há formas de pagamento listadas no perfil
	    When eu seleciono "Adicionar forma de pagamento"
	    And eu preencho os dados com tipo "Cascalho" e número/código "123456-789"
	    And eu seleciono "Confirmar"
	    Then eu consigo ver uma mensagem de confirmação do cadastro da nova forma de pagamento
	    And eu continuo na página "Formas de pagamento"
	    And o perfil de usuário "Henrique" é registrado no sistema com a forma de pagamento "Cascalho" de número/código "XXXXXX-XXX" cadastrada
	    And eu consigo ver a forma de pagamento "Cascalho" com número/código "123456-789" listada no perfil

    Scenario: Cadastrar forma de pagamento (limite de formas de pagamento atingido)
	    Given eu estou logado como usuário "Henrique"
	    And eu estou na página "Formas de pagamento"
	    And eu vejo as formas de pagamento "sal, papel, moeda" listadas no perfil
	    When eu seleciono "Adicionar forma de pagamento"
	    And eu preencho os dados com tipo "Cascalho" e número/código "098765-432"
	    And eu seleciono "Confirmar"
	    Then eu consigo ver uma mensagem de erro sobre limite de formas de pagamento atingido
	    And eu continuo na página "Formas de pagamento"
	    And o perfil de usuário "Henrique" é registrado no sistema com as formas de pagamento "Sal, Papel, Moeda"
	    And eu consigo ver as formas de pagamento "sal, papel, moeda" listadas no perfil

    Scenario: Cadastrar forma de pagamento já cadastrada
	    Given eu estou logado como usuário "Henrique"
	    And eu estou na página "Formas de pagamento"
	    And eu vejo a forma de pagamento "Cascalho" com número/código "372585-686" listada no perfil
	    When eu seleciono "Adicionar forma de pagamento"
	    And eu preencho os dados com tipo "Cascalho" e número/código "372585-686"
	    And eu seleciono "Confirmar"
	    Then eu consigo ver uma mensagem de erro sobre forma de pagamento já cadastrada
	    And eu continuo na página "Formas de pagamento"
	    And o perfil de usuário "Henrique" é registrado no sistema com a forma de pagamento "Cascalho"
	    And eu consigo ver a forma de pagamento "cascalho" listada apenas uma vez no perfil

    Scenario: Cancelar cadastro de forma de pagamento
	    Given eu estou logado como usuário "Henrique"
	    And eu estou na página "Formas de pagamento"
	    And eu vejo que não há formas de pagamento listadas no perfil
	    When eu seleciono "Adicionar forma de pagamento"
	    And eu preencho os dados com tipo "Cascalho" e número/código "456322-000"
	    And eu seleciono "Cancelar"
	    Then eu continuo na página "Formas de pagamento"
	    And o perfil de usuário "Henrique" é registrado no sistema com a forma de pagamento "Cascalho"
	    And eu consigo ver que não há formas de pagamento listadas no perfil

    Scenario: Cadastrar de forma de pagamento inválida
	    Given eu estou logado como usuário "Henrique"
	    And eu estou na página "Formas de pagamento"
	    And eu vejo que não há formas de pagamento listadas no perfil
	    When eu seleciono "Adicionar forma de pagamento"
	    And eu preencho os dados com tipo "cascalho" e número/código "---"
	    And eu seleciono "Confirmar"
	    Then eu consigo ver uma mensagem de erro sobre forma de pagamento inválida
        And eu continuo na página "Formas de pagamento"
        And eu consigo ver que não há formas de pagamento listadas
        