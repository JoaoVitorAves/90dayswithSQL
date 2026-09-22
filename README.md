# SQL 90 — 90 perguntas de negócio respondidas com SQL

![Progresso](https://img.shields.io/badge/progresso-1%2F90-2ea44f)
![SQL](https://img.shields.io/badge/linguagem-SQL-336791)

Durante 90 dias, resolvo uma pergunta por dia usando SQL. A regra é simples: nada de exercício solto. Cada query parte de uma pergunta que poderia aparecer de verdade numa empresa (RH, vendas, produto, finanças) e vem acompanhada do contexto, da abordagem e do que eu aprendi resolvendo.

O objetivo é sair do "sei a sintaxe" para o "sei transformar uma pergunta de negócio em análise".

---

## Como cada arquivo é organizado

Todo `.sql` deste repositório segue o mesmo formato:

| Seção | O que tem |
|---|---|
| **Pergunta** | O problema a ser resolvido |
| **Por que isso importa** | O contexto de negócio: quem usaria essa resposta e para quê |
| **Abordagem** | A lógica da solução antes do código |
| **Conceitos** | As técnicas de SQL usadas |
| **Aprendizado** | Erros, alternativas testadas e o que ficou de lição |
| **Solução** | A query que responde exatamente à pergunta |
| **Indo além** *(quando faz sentido)* | Uma versão mais completa, pensada para quem vai consumir o resultado |

---

## Estrutura

```
sql-90/
├── 01-fundamentos/        # dias 1–30: filtros, agregações, joins, CTEs
├── 02-window-functions/   # dias 31–60: ranking, acumulados, comparação entre períodos
└── 03-analises/           # dias 61–90: coorte, funil, retenção, análises completas
```

---

## Índice

| # | Pergunta | Conceitos | Área |
|---|---|---|---|
| 001 | [Funcionários que ganham mais que o próprio gestor](01-fundamentos/001_funcionarios_ganham_mais_que_gestor.sql) | CTE, self-join | RH |

---

## Conceitos praticados até agora

- CTEs (`WITH`)
- Self-join
- `INNER JOIN` vs `LEFT JOIN` e o efeito do `WHERE` sobre valores nulos

---

## Fontes dos exercícios

Parte das perguntas vem de plataformas de prática de SQL, sempre indicadas no cabeçalho de cada arquivo. O contexto de negócio, os comentários e as versões estendidas são meus.

---

## Contato

Se quiser trocar ideia sobre alguma solução ou sugerir uma abordagem diferente, me chama:

- LinkedIn: [seu-linkedin](https://www.linkedin.com/in/seu-usuario)
- E-mail: seu-email@exemplo.com
