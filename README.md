# Planejador para o Mundo dos Blocos

Este projeto implementa um planejador para o problema do Mundo dos Blocos com blocos de diferentes tamanhos, utilizando técnicas de planejamento baseado em regressão de metas.

## Estrutura do Projeto

- `world_definition.pl`: Define o mundo dos blocos, incluindo blocos, lugares, tamanhos e estados inicial e final.
- `actions.pl`: Implementa as ações possíveis (movimento de blocos) e suas pré-condições.
- `planner.pl`: Contém o algoritmo de planejamento baseado em regressão de metas.
- `main.pl`: Arquivo principal para carregar os módulos e executar os cenários.

## Como Executar

1. Certifique-se de ter o SWI-Prolog instalado em seu sistema.
2. Clone este repositório:
   ```
   git clone https://github.com/seu-usuario/mundo-dos-blocos.git
   ```
3. Navegue até o diretório do projeto:
   ```
   cd mundo-dos-blocos
   ```
4. Inicie o SWI-Prolog e carregue o arquivo principal:
   ```
   swipl -s main.pl
   ```
5. Execute o cenário definido usando o predicado `run_scenario/2`:
   ```prolog
   ?- run_scenario(1, Plan), display_plan(Plan).
   ```

## Explicação do Cenário

O cenário implementado move os blocos do estado inicial (i1) para o estado final (i2) conforme definido no arquivo `world_definition.pl`. O planejador gera uma sequência de movimentos para atingir o estado objetivo.

## Personalizando o Problema

Para definir novos cenários ou modificar o mundo dos blocos:

1. Edite `world_definition.pl` para alterar blocos, tamanhos ou estados.
2. Modifique `actions.pl` se necessário para ajustar as regras de movimentação.
3. Adicione novos cenários em `main.pl` criando predicados `run_scenario/2` adicionais.

## Limitações e Possíveis Melhorias

- O planejador atual não considera otimização do número de movimentos.
- Pode ser estendido para lidar com mais tipos de ações ou restrições.
- A performance pode ser melhorada para cenários mais complexos.

