---
name: anotacoes-estudo
description: >-
  Gera material didático estruturado de estudo técnico, anotações aprofundadas de aulas/cursos e listas de exercícios com gabarito no formato HTML estilizado na pasta 'docs/anotacoes/'. Ative quando o usuário pedir para 'estudar', 'anotar', 'documentar meu aprendizado sobre', 'fazer anotações de', 'transformar essa aula/texto em material de estudo', colar transcrições/textos técnicos de cursos, ou solicitar listas de exercícios sobre um tema de estudo.
---

# Skill: Anotações de Estudo & Material Didático em HTML (`anotacoes-estudo`)

Esta skill atua como um **Tutor e Mentor Técnico Especialista**, transformando transcrições de aulas, artigos, anotações brutas e tópicos conceituais em **material de estudo didático, aprofundado, visual e interativo**, **sempre gerado no formato `.html`** e armazenado de forma organizada na pasta `docs/anotacoes/` para publicação direta no **GitHub Pages**.

---

## 🎯 Princípios Fundamentais

1. **Formato Exclusivo em HTML**: Todas as anotações e listas de exercícios geradas por esta skill devem ser arquivos `.html` auto-contidos, prontos para abertura imediata no navegador com design moderno, responsivo e suporte a modo escuro.
2. **Didática Real (Não Resumo Raso)**: Nunca faça apenas uma cópia resumida do texto de entrada. Ensine o conceito partindo do zero até o nível prático, explicando o *porquê*, o *como funciona por baixo dos panos* e *quando aplicar*.
3. **Renderização Visual de Diagramas com Mermaid.js**: Inclua a biblioteca Mermaid.js via CDN (`https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js`) em cada arquivo HTML para renderizar diagramas de fluxo, arquitetura e comparações visuais nítidas.
4. **Organização Modular**: Arquivos separados por categoria/subtema dentro de `docs/anotacoes/` (ex: `docs/anotacoes/kafka/particoes.html`, `docs/anotacoes/spring-boot/injecao-dependencias.html`), nunca acumulados em um único arquivo desorganizado.
5. **Sem Sobrescrita Silenciosa**: Se o arquivo `.html` já existir, confirme com o usuário se deve complementar ou criar uma nova versão.
6. **Exercícios Sob Demanda**: Gere material de exercícios apenas quando solicitado explicitamente pelo usuário, salvo em `docs/anotacoes/<categoria>/<tema>-exercicios.html` com gabarito em seção interativa retrátil.
7. **Integridade de Links**: Links de referência devem ser **reais e canônicos** (documentação oficial, RFCs, GitHub oficial). Nunca invente URLs.

---

## 📋 Fluxo de Execução Passo a Passo

### Passo 1: Validação do Contexto de Entrada
- **Caso 1: O usuário forneceu o texto/transcrição/tema no prompt**: Prossiga para a análise e estruturação.
- **Caso 2: O usuário indicou que o contexto está na pasta `contexto/`**:
  1. Liste os arquivos dentro de `contexto/` usando a ferramenta de listagem de diretório.
  2. Se houver apenas 1 arquivo, leia-o e use-o como contexto.
  3. Se houver **mais de 1 arquivo** e o usuário não especificou qual, **pergunte educadamente ao usuário qual arquivo deve ser utilizado**.
- **Caso 3: Nenhum contexto ou tema foi enviado**:
  - Solicite o contexto ao usuário antes de criar os arquivos:
    > *"Por favor, envie o texto da aula, transcrição ou o tema técnico que você deseja estudar e transformar em material didático HTML."*

---

### Passo 2: Estrutura de Diretórios e Verificação de Conflitos
1. Verifique se a pasta `docs/anotacoes/` existe. Se não existir, crie-a.
2. Identifique a categoria lógica e o nome do arquivo a partir do assunto (ex: `docs/anotacoes/kafka/particoes.html`, `docs/anotacoes/spring-boot/injecao-dependencias.html`, `docs/anotacoes/banco-de-dados/postgres-vs-mongo.html`).
3. **Verificação de Arquivo Existente**:
   - Se o arquivo de destino `.html` já existir no diretório, **pergunte ao usuário**:
     > *"Já existe uma anotação sobre este tema em `docs/anotacoes/<caminho>.html`. Você prefere que eu:*
     > 1. *Complemente a anotação existente com as novas informações.*
     > 2. *Crie um novo arquivo com sufixo ou em subpasta separada.*"

---

### Passo 3: Criação do Material de Estudo HTML (`docs/anotacoes/<categoria>/<tema>.html`)

Gere o arquivo `.html` completo utilizando as bibliotecas CDN para visual moderno e componentes ricos:
- **Tailwind CSS CDN**: `<script src="https://cdn.tailwindcss.com"></script>`
- **Google Fonts**: `Plus Jakarta Sans` & `JetBrains Mono`
- **Lucide Icons CDN**: `<script src="https://unpkg.com/lucide@latest"></script>`
- **Mermaid.js CDN**: `<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>` com inicialização no tema escuro.

#### Estrutura Visual Obrigatória do Documento HTML:
1. **Cabeçalho & Metadados**:
   - Título principal, Badge de Categoria, Nível de Dificuldade, Data e Botão de Imprimir/Exportar.
2. **📌 Resumo Rápido / Visão Geral**:
   - Caixa de destaque (Callout) com síntese de 2 a 3 frases sobre o que é o conceito e seu maior benefício.
3. **💡 1. Por Que Isso Importa? (Contexto & Aplicação Prática)**:
   - Problema real que resolve, cenários de uso recomendados e trade-offs (quando NÃO usar).
4. **🧩 2. Explicação Conceitual & Analogia**:
   - Modelo mental intuitivo, analogia prática do mundo real e funcionamento interno por baixo dos panos.
5. **📊 3. Representação Visual (Mermaid Diagram)**:
   - Bloco `<pre class="mermaid">...</pre>` com fluxos, arquiteturas, ciclo de vida ou comparações.
6. **💻 4. Exemplo Prático & Hands-on**:
   - Código, query SQL ou configuração comentada linha a linha, com botão de copiar código.
7. **⚠️ 5. Erros Comuns, Boas Práticas & Dica para Entrevistas**:
   - Armadilhas frequentes de iniciantes, padrões de mercado e como defender o assunto em entrevistas.
8. **📌 6. TL;DR (Pontos-Chave para Revisão)**:
   - Lista resumida com os 3 a 5 pontos fundamentais para revisão rápida.
9. **🔗 7. Referências & Material Complementar**:
   - Links reais para documentações oficiais e RFCs.

---

### Passo 4: Geração de Exercícios em HTML (Somente se Solicitado Explicitamente)

Quando o usuário pedir exercícios (ex: *"crie exercícios sobre esse tema"* ou *"faça exercícios para fixar"*), crie o arquivo `docs/anotacoes/<categoria>/<tema>-exercicios.html` contendo:

1. **Parte 1: Fixação Teórica & Conceitual**:
   - 3 a 5 perguntas reflexivas e cenários de tomada de decisão técnica.
2. **Parte 2: Desafios Práticos & Hands-on**:
   - 2 a 3 desafios práticos de código, modelagem ou configuração.
3. **Parte 3: Gabarito e Soluções Explicadas com Spoiler Toggle**:
   - Bloco interativo com tag `<details class="bg-slate-900 border border-slate-800 rounded-xl p-4 cursor-pointer">` para proteger as respostas contra visualização antecipada.

---

## 🔍 Checklist de Qualidade da Anotação HTML

Antes de finalizar o arquivo, valide:
- [ ] O arquivo foi salvo com extensão `.html` dentro da pasta `docs/anotacoes/` para publicação no GitHub Pages?
- [ ] O HTML é auto-contido e abre diretamente no navegador com Tailwind, fontes e ícones?
- [ ] Contém pelo menos 1 diagrama visual em Mermaid válido renderizado via `mermaid.js`?
- [ ] As explicações práticas, analogias e exemplos detalham o conceito com profundidade?
- [ ] A seção de referências contém apenas URLs reais e confiáveis?
- [ ] Se houver exercícios, o gabarito está interativo e protegido contra spoilers?
