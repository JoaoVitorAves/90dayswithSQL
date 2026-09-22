/*
================================================================================
  #002 — Item mais vendido em cada mês
================================================================================

  FONTE: StrataScratch — "Best Selling Item" (ID 10172, nível Hard)

  PERGUNTA
  Qual foi o item mais vendido em cada mês? "Mais vendido" é o item com
  maior valor total de vendas (unitprice * quantity). Devoluções e
  cancelamentos devem ser ignorados. Retornar mês, descrição do item e
  valor total pago. Os meses não precisam ser separados por ano.

  POR QUE ISSO IMPORTA
  Saber qual produto lidera o faturamento em cada mês ajuda a:
    - identificar sazonalidade (itens que só explodem em certas épocas);
    - planejar estoque antes dos picos de demanda;
    - escolher produtos para campanhas e vitrines.

  ABORDAGEM
  1. Limpar os dados: remover devoluções (quantity negativa),
     cancelamentos (fatura começando com 'C') e itens sem descrição.
  2. Agregar o faturamento por mês e por item numa CTE.
  3. Pegar, para cada mês, o item de maior faturamento com DISTINCT ON.

  CONCEITOS: CTE, EXTRACT, CAST, GROUP BY, DISTINCT ON (PostgreSQL)
================================================================================
*/

WITH vendas_mensais AS (
    SELECT
        EXTRACT(MONTH FROM CAST(invoicedate AS TIMESTAMP)) AS month,
        description,
        SUM(unitprice * quantity) AS total_paid
    FROM online_retail
    WHERE quantity > 0
      AND invoiceno NOT LIKE 'C%'
      AND description IS NOT NULL
    GROUP BY 1, 2
)

-- Solução: responde exatamente à pergunta
SELECT DISTINCT ON (month)
    month,
    description,
    total_paid
FROM vendas_mensais
ORDER BY
    month ASC,
    total_paid DESC;


/*
--------------------------------------------------------------------------------
  INDO ALÉM
  Versão que utiliza RANK() em vez de DISTINCT ON,
  mantém itens empatados e mostra quanto o campeão representa do
  faturamento total do mês. Um item com 2% do mês é um "campeão" bem
  diferente de um item com 20%.
--------------------------------------------------------------------------------
*/

WITH vendas_mensais AS (
    SELECT
        EXTRACT(MONTH FROM CAST(invoicedate AS TIMESTAMP)) AS month,
        description,
        SUM(unitprice * quantity) AS total_paid
    FROM online_retail
    WHERE quantity > 0
      AND invoiceno NOT LIKE 'C%'
      AND description IS NOT NULL
    GROUP BY 1, 2
),

ranking AS (
    SELECT
        month,
        description,
        total_paid,
        RANK() OVER (PARTITION BY month ORDER BY total_paid DESC) AS posicao,
        SUM(total_paid) OVER (PARTITION BY month)                AS faturamento_mes
    FROM vendas_mensais
)

SELECT
    month,
    description,
    total_paid,
    ROUND((100.0 * total_paid / faturamento_mes)::numeric, 2) AS participacao_pct
FROM ranking
WHERE posicao = 1
ORDER BY month;
