# SQL 90 — 90 perguntas de negócio respondidas com SQL

![SQL](https://img.shields.io/badge/linguagem-SQL-336791)

Durante 90 dias, resolvo uma pergunta por dia usando SQL. A regra é simples: nada de exercício solto. Cada query parte de uma pergunta que poderia aparecer de verdade numa empresa (RH, vendas, produto, finanças) e vem acompanhada do contexto, da abordagem e do que eu aprendi resolvendo.

O objetivo é sair do "sei a sintaxe" para o "sei transformar uma pergunta de negócio em análise".

---

## Navegação

| Módulo | Dias | Foco |
|---|:---:|---|
| [01 · Fundamentos](01-fundamentos/) | 1–30 | Filtros, agregações, joins e CTEs |
| [02 · Window Functions](02-window-functions/) | 31–60 | Ranking, acumulados e comparação entre períodos |
| [03 · Análises](03-analises/) | 61–90 | Coorte, funil, retenção e análises completas |

Cada módulo tem um índice com todos os dias, a pergunta resolvida e o link para a solução.

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

Nos dias de destaque, a solução também ganha um arquivo `.md` com explicação visual: tabelas comparativas, casos de borda e diagramas.

---

## Estrutura

```
sql-90/
├── README.md
├── imagens/                  # imagens usadas nos arquivos .md
├── 01-fundamentos/           # dias 1–30: filtros, agregações, joins, CTEs
│   └── README.md             # índice do módulo
├── 02-window-functions/      # dias 31–60: ranking, acumulados, comparação entre períodos
│   └── README.md
└── 03-analises/              # dias 61–90: coorte, funil, retenção, análises completas
    └── README.md
```

---

## Conceitos praticados até agora

- CTEs (`WITH`)
- Joins variados, incluindo self-join
- Views
- Window functions (`DENSE_RANK`)
- Funis avançados

---

## Fontes dos exercícios

Parte das perguntas vem de plataformas de prática de SQL, sempre indicadas no cabeçalho de cada arquivo. O contexto de negócio, os comentários e as versões estendidas são meus.

---

## Contato

Se quiser trocar ideia sobre alguma solução ou sugerir uma abordagem diferente, me chama:

- LinkedIn: [João Vitor](https://www.linkedin.com/in/joao-vitor-dataanalyst/)
- E-mail: joaoalvesngcs@gmail.com
