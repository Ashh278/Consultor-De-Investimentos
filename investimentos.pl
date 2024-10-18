% investimento(Nome, Risco, Rentabilidade).
investimento(cdb, baixo, moderado).
investimento(poupanca, baixo, baixo).
investimento(acoes, alto, alto).
investimento(fundos_imobiliarios, moderado, moderado).
investimento(tesouro_direto, baixo, moderado).
investimento(criptomoedas, alto, alto).
investimento(fundos_de_acao, moderado, alto).
investimento(renda_fixa, baixo, baixo).
investimento(fundos_de_tudo, moderado, moderado).
investimento(debentures, moderado, alto).
investimento(fundos_previdencia, baixo, moderado).
investimento(acoes_tecnologia, alto, alto).
investimento(acoes_dividendos, moderado, alto).
investimento(etfs, moderado, alto).
investimento(fundos_credito, moderado, moderado).

% perfil_risco(Respostas, Perfil)
perfil_risco([baixo, baixo, baixo], conservador).
perfil_risco([baixo, baixo, moderado], conservador_extremo).
perfil_risco([moderado, moderado, baixo], moderado).
perfil_risco([alto, moderado, moderado], agressivo).
perfil_risco([alto, alto, alto], muito_agressivo).
perfil_risco([baixo, moderado, baixo], perfil_adequado).
perfil_risco([baixo, alto, baixo], conservador_modificado).
perfil_risco([alto, baixo, moderado], agressivo_modificado).
perfil_risco([alto, moderado, alto], arrojado).
perfil_risco([moderado, baixo, moderado], equilibrado).
perfil_risco([moderado, alto, moderado], dinâmico).

% estrategia_investimento(Perfil, Estrategia)
estrategia_investimento(conservador, [poupanca, cdb, tesouro_direto]).
estrategia_investimento(conservador_extremo, [poupanca, cdb, renda_fixa]).
estrategia_investimento(moderado, [cdb, tesouro_direto, fundos_imobiliarios, debentures]).
estrategia_investimento(agressivo, [acoes, fundos_imobiliarios, acoes_tecnologia]).
estrategia_investimento(muito_agressivo, [acoes, criptomoedas, fundos_de_acao]).
estrategia_investimento(perfil_adequado, [poupanca, tesouro_direto]).
estrategia_investimento(conservador_modificado, [poupanca, renda_fixa, tesouro_direto]).
estrategia_investimento(agressivo_modificado, [acoes, criptomoedas, fundos_de_acao, fundos_imobiliarios]).
estrategia_investimento(arrojado, [acoes_tecnologia, acoes_dividendos, etfs]).
estrategia_investimento(equilibrado, [cdb, fundos_credito, debentures]).
estrategia_investimento(dinâmico, [acoes, etfs, fundos_de_acao]).


% sugerir_investimentos(Respostas, Sugestao).
sugerir_investimentos(Respostas, Sugestao) :-
    perfil_risco(Respostas, Perfil),
    estrategia_investimento(Perfil, Sugestao).

