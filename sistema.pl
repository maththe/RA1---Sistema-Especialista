% Trilhas
trilha(ciencia_dados, "Analise e interpretacao de grandes volumes de dados, aplicando estatistica, programacao e tecnicas de machine learning para extrair conhecimento e gerar valor.").
trilha(inteligencia_artificial, "Desenvolvimento de sistemas inteligentes capazes de aprender, raciocinar e tomar decisoes, explorando machine learning, redes neurais e processamento de linguagem natural.").
trilha(desenvolvimento_web, "Criacao de sites e aplicacoes para a web, abrangendo front-end (HTML, CSS, JavaScript) e back-end (APIs, bancos de dados e servidores)."). 
trilha(seguranca_informacao, "Protecao de sistemas, redes e dados contra acessos indevidos, ataques ciberneticos e vazamentos, garantindo confidencialidade, integridade e disponibilidade.").
trilha(devops, "Automacao de processos de desenvolvimento e infraestrutura com integracao continua (CI/CD), monitoramento de sistemas e uso de containers e servicos em nuvem.").
trilha(iot, "Projetos de Internet das Coisas (IoT), integrando sensores, atuadores e sistemas embarcados para automacao, coleta de dados e controle remoto em tempo real.").
trilha(jogos_digitais, "Concepcao e desenvolvimento de jogos digitais, envolvendo programacao, design grafico, engines de jogos e experiencia interativa para multiplas plataformas.").
trilha(banco_dados, "Modelagem, administracao e otimizacao de bancos de dados relacionais e nao relacionais, garantindo desempenho, seguranca e integridade das informacoes.").

% Pesos
% Ciencia de Dados
perfil(ciencia_dados, matematica_estatistica, 5).
perfil(ciencia_dados, raciocinio_logico, 4).
perfil(ciencia_dados, programacao, 4).
perfil(ciencia_dados, html_css_js, 0).
perfil(ciencia_dados, design_digital, 0).
perfil(ciencia_dados, infra_cloud, 2).
perfil(ciencia_dados, hardware, 0).

% Inteligencia Artificial
perfil(inteligencia_artificial, matematica_estatistica, 4).
perfil(inteligencia_artificial, raciocinio_logico, 5).
perfil(inteligencia_artificial, programacao, 5).
perfil(inteligencia_artificial, html_css_js, 0).
perfil(inteligencia_artificial, design_digital, 0).
perfil(inteligencia_artificial, infra_cloud, 2).
perfil(inteligencia_artificial, hardware, 1).

% Desenvolvimento Web
perfil(desenvolvimento_web, matematica_estatistica, 0).
perfil(desenvolvimento_web, raciocinio_logico, 3).
perfil(desenvolvimento_web, programacao, 4).
perfil(desenvolvimento_web, html_css_js, 5).
perfil(desenvolvimento_web, design_digital, 5).
perfil(desenvolvimento_web, infra_cloud, 1).
perfil(desenvolvimento_web, hardware, 0).

% Seguranca da Informacao
perfil(seguranca_informacao, matematica_estatistica, 3).
perfil(seguranca_informacao, raciocinio_logico, 4).
perfil(seguranca_informacao, programacao, 4).
perfil(seguranca_informacao, html_css_js, 0).
perfil(seguranca_informacao, design_digital, 0).
perfil(seguranca_informacao, infra_cloud, 5).
perfil(seguranca_informacao, hardware, 2).

% DevOps
perfil(devops, matematica_estatistica, 2).
perfil(devops, raciocinio_logico, 3).
perfil(devops, programacao, 4).
perfil(devops, html_css_js, 0).
perfil(devops, design_digital, 0).
perfil(devops, infra_cloud, 5).
perfil(devops, hardware, 2).

% IoT
perfil(iot, matematica_estatistica, 2).
perfil(iot, raciocinio_logico, 3).
perfil(iot, programacao, 4).
perfil(iot, html_css_js, 0).
perfil(iot, design_digital, 0).
perfil(iot, infra_cloud, 3).
perfil(iot, hardware, 5).

% Jogos Digitais
perfil(jogos_digitais, matematica_estatistica, 1).
perfil(jogos_digitais, raciocinio_logico, 3).
perfil(jogos_digitais, programacao, 5).
perfil(jogos_digitais, html_css_js, 3).
perfil(jogos_digitais, design_digital, 5).
perfil(jogos_digitais, infra_cloud, 0).
perfil(jogos_digitais, hardware, 2).

% Banco de Dados
perfil(banco_dados, matematica_estatistica, 5).
perfil(banco_dados, raciocinio_logico, 4).
perfil(banco_dados, programacao, 3).
perfil(banco_dados, html_css_js, 0).
perfil(banco_dados, design_digital, 0).
perfil(banco_dados, infra_cloud, 3).
perfil(banco_dados, hardware, 0).

% Perguntas
pergunta(1, "Voce gosta de matematica e estatistica aplicadas para resolver problemas?", matematica_estatistica).
pergunta(2, "Voce se diverte resolvendo enigmas ou quebra cabecas logicos?", raciocinio_logico).
pergunta(3, "Voce tem interesse em programacao de software e algoritmos?", programacao).
pergunta(4, "Voce ja criou ou gostaria de criar paginas web usando HTML, CSS  e JavaScript?", html_css_js).
pergunta(5, "Voce gosta de desenhar interfaces ou se preocupa com a aparencia dos sistemas?", design_digital).
pergunta(6, "Voce tem interesse em trabalhar com servidores, redes ou computacao em nuvem?", infra_cloud).
pergunta(7, "Voce gosta de montar ou mexer em hardware, sensores ou dispositivos fisicos?", hardware).
pergunta(8, "Voce gostaria de aprofundar em logica para competir em desafios de programacao ou olimpiadas?", raciocinio_logico).
pergunta(9, "Voce gostaria de trabalhar com dados, planilhas e graficos para encontrar padroes escondidos?", matematica_estatistica).
pergunta(10, "Voce se sente animado em criar jogos, apps ou sistemas do zero via programacao?", programacao).


% Motor de Inferencia
:- dynamic resposta/2.

% util
somar_lista([], 0).
somar_lista([H|T], S) :-
    somar_lista(T, R),
    S is H + R.

limpar_respostas :- retractall(resposta(_,_)).

% pontuacao por trilha
calcular_pontuacao_trilha(Trilha, Pontuacao) :-
    findall(Peso,
        ( perfil(Trilha, Caracteristica, Peso),
          pergunta(Id, _Txt, Caracteristica),
          resposta(Id, s)
        ),
        Pesos),
    somar_lista(Pesos, Pontuacao).

calcula_pontuacao(Trilha, Pontuacao, _Ctx) :-
    calcular_pontuacao_trilha(Trilha, Pontuacao).

% lista (Trilha, Pontuacao) sem ordenar
todas_pontuacoes(Tuplas_tp) :-
    findall((T, P),
        ( trilha(T, _),
          calcular_pontuacao_trilha(T, P)
        ),
        Tuplas_tp).

% ordenacao decrescente por pontuacao
comparar_tp(Delta, (_T1,P1), (_T2,P2)) :-
    compare(Delta, P2, P1).

ranking_trilha_pontuacao(Tuplas_ordenadas) :-
    todas_pontuacoes(Tuplas),
    predsort(comparar_tp, Tuplas, Tuplas_ordenadas).

% APIs
recomenda(Ranking_ordenado) :-
    ranking_trilha_pontuacao(Ranking_ordenado).

recomenda(Trilhas_topo, Pontuacao_maxima) :-
    ranking_trilha_pontuacao([(Trilha1,Pmax)|Resto]),
    Pontuacao_maxima = Pmax,
    findall(T, member((T,Pmax), [(Trilha1,Pmax)|Resto]), Trilhas_topo).

recomenda_trilha(Trilha_escolhida, Pontuacao_maxima) :-
    ranking_trilha_pontuacao([(Trilha_escolhida, Pontuacao_maxima)|_]).

% Interface de usuario

iniciar :-
    limpar_respostas,
    writeln("  Sistema de recomendacao de trilhas"),
    writeln("  Responda apenas com s ou n (sem ponto final)"),
    obter_ids_perguntas(Ids),
    perguntar_ids(Ids),
    ranking_trilha_pontuacao(Ranking),
    exibir_recomendacao(Ranking).

obter_ids_perguntas(Ids_ordenados) :-
    findall(Id, pergunta(Id,_,_), Ids),
    sort(Ids, Ids_ordenados).

perguntar_ids([]).
perguntar_ids([Id|Resto]) :-
    pergunta(Id, Texto, _Carac),
    format("~w~n> ", [Texto]),
    read_line_to_string(user_input, In0),
    string_lower(In0, In),
    ( In = "s" -> Resp = s
    ; In = "n" -> Resp = n
    ; writeln("Use s ou n."), !, perguntar_ids([Id|Resto])
    ),
    assertz(resposta(Id, Resp)),
    perguntar_ids(Resto).

% -------- exibicao --------

exibir_recomendacao([]) :-
    writeln("Nenhuma trilha recomendada.").
exibir_recomendacao([(Trilha_top, Pmax)|Resto]) :-
    % coletar todos os empatados no topo
    findall(T, member((T,Pmax), [(Trilha_top,Pmax)|Resto]), Topos),
    writeln(""),
    writeln("Voce se enquadra em:"),
    listar_topos(Topos, Pmax),
    writeln(""),
    writeln("Justificativas (respostas que contaram):"),
    justificar_topos(Topos),
    writeln("----------------------------------------------"),
    writeln("Outras possiveis opcoes:"),
    filtrar_restantes([(Trilha_top,Pmax)|Resto], Pmax, Restantes),
    exibir_outros(Restantes).

listar_topos([], _).
listar_topos([T|Ts], P) :-
    trilha(T, Desc),
    format("Trilha: ~w (~w pontos)~n", [T, P]),
    format("Descricao: ~w~n", [Desc]),
    listar_topos(Ts, P).

justificar_topos([]).
justificar_topos([T|Ts]) :-
    justificar_trilha(T),
    justificar_topos(Ts).

filtrar_restantes(Lista, Pmax, Restantes_ord) :-
    include(\=( (_T,Pmax) ), Lista, Sem_topos),
    % opcional: esconder zeros
    include(tem_pontos, Sem_topos, Sem_zeros),
    predsort(comparar_tp, Sem_zeros, Restantes_ord).

tem_pontos((_T,P)) :- P > 0.

exibir_outros([]) :-
    writeln(" - (nenhuma)").
exibir_outros(Lista) :-
    forall(member((T,P), Lista),
        (   trilha(T, Desc),
            format(" - ~w: ~w pontos~n", [T, P]),
            format("   ~w~n", [Desc])
        )
    ).

justificar_trilha(Trilha) :-
    (   findall((Texto,Peso),
            ( pergunta(Id, Texto, Carac),
              resposta(Id, s),
              perfil(Trilha, Carac, Peso),
              Peso > 0
            ),
            Pares),
        Pares \= []
    ->  forall(member((Txt,Pz), Pares),
            format(" - ~w (+~w)~n", [Txt, Pz]))
    ;   writeln(" - (sem respostas positivas que contem para esta trilha)")
    ).

% teste local
carregar_perfil(Arquivo) :-
    limpar_respostas,
    consult(Arquivo).

rodar_teste(Arquivo) :-
    carregar_perfil(Arquivo),
    ranking_trilha_pontuacao(Ranking),
    exibir_recomendacao(Ranking).

rodar_todos :-
    forall(member(F, ['resposta1.pl','resposta2.pl','resposta3.pl']),
           ( format("== ~w ==~n", [F]),
             rodar_teste(F), nl )).
