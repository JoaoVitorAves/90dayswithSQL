/*
================================================================================
  #001 — Funcionários que ganham mais que o próprio gestor
================================================================================

  PERGUNTA
  Quais funcionários ganham mais que seus gestores? Retornar o primeiro nome
  e o salário de cada um.

  POR QUE ISSO IMPORTA
  Inversões salariais (subordinado ganhando mais que o chefe) são um ponto
  clássico de auditoria de RH. Podem indicar:
    - distorção na política de cargos e salários;
    - risco de retenção do gestor, que pode se sentir desvalorizado;
    - especialistas técnicos bem pagos em times de gestão mais júnior
      (o que pode ser intencional e saudável);
    - simples erro de cadastro na base.
  Em qualquer desses casos, a primeira etapa é a mesma: encontrar os casos.

  ABORDAGEM
  A tabela `employee` referencia a si mesma: `manager_id` aponta para o `id`
  de outro funcionário. Isso pede um SELF-JOIN.
  Separei a mesma tabela em duas CTEs (gestores e funcionarios) para deixar
  explícito o papel de cada lado do join e facilitar a leitura.

  CONCEITOS: CTE, self-join, INNER JOIN vs LEFT JOIN

  APRENDIZADO
  Na primeira versão usei LEFT JOIN. Mas o filtro no WHERE
  (salary > manager_salary) já descarta quem não tem gestor, porque a
  comparação com NULL nunca é verdadeira. Na prática o LEFT JOIN virava
  um INNER JOIN, então troquei para deixar a intenção clara no código.
================================================================================
*/

WITH gestores AS (
    SELECT
        id,
        first_name AS manager_name,
        salary     AS manager_salary
    FROM employee
),

funcionarios AS (
    SELECT
        id,
        first_name,
        salary,
        manager_id
    FROM employee
)

-- Solução: responde exatamente à pergunta
SELECT
    f.first_name,
    f.salary
FROM funcionarios AS f
INNER JOIN gestores AS g
    ON f.manager_id = g.id
WHERE f.salary > g.manager_salary;


/*
--------------------------------------------------------------------------------
  Em uma query um pouco mais pensada.
  Para um relatório de RH, só o nome e o salário não bastam: quem recebe
  essa lista vai perguntar "qual gestor?" e "qual o tamanho da diferença?".
  sendo assim... fiz uma versão mais organizada e ordenada pelos casos mais gritantes.
--------------------------------------------------------------------------------
*/

WITH gestores AS (
    SELECT
        id,
        first_name AS manager_name,
        salary     AS manager_salary
    FROM employee
),

funcionarios AS (
    SELECT
        id,
        first_name,
        salary,
        manager_id
    FROM employee
)

SELECT
    f.first_name                                                AS funcionario,
    f.salary                                                    AS salario_funcionario,
    g.manager_name                                              AS gestor,
    g.manager_salary                                            AS salario_gestor,
    f.salary - g.manager_salary                                 AS diferenca,
    ROUND(100.0 * (f.salary - g.manager_salary) / g.manager_salary, 1) AS diferenca_pct
FROM funcionarios AS f
INNER JOIN gestores AS g
    ON f.manager_id = g.id
WHERE f.salary > g.manager_salary
ORDER BY diferenca_pct DESC;
