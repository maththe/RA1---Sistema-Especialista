<h1>Sistema Especialista em Prolog</h1>


<h2>Divisão do Trabalho</h2>
<ul>
  <li><strong>Rafael Maluf</strong>: Trilhas, perguntas e pesos (base de conhecimento).</li>
  <li><strong>Henry Mendes</strong>: Motor de inferência (cálculo e ranking).</li>
  <li><strong>Matheus Bernardi</strong>: Interface (perguntas, exibição formatada, testes).</li>
  <li><strong>Kaue Alaniz</strong>: Arquivos de teste (<code>resposta1.pl</code>, <code>resposta2.pl</code>, <code>resposta3.pl</code>).</li>
</ul>
<h2>Como Executar</h2>
  <li>Para executar você deve ter o SWI-Prolog instalado: <a href="https://www.swi-prolog.org/download/stable">download aqui</a>.</li>
  
  <li>Baixe os arquivos desse repositorio e salve em uma pasta (ou clone o repositorio).</li>

  <li>Abra o terminal e navegue até eles:</li>
    <pre><code>cd caminho-até-a-pasta-com-os-arquivos</code></pre>
    
  <li>Inicie o SWI-Prolog:</li>
<pre><code>swipl</code></pre>

  <li>Carregue o sistema:</li>
<pre><code>?- [sistema].</code></pre>

<h2>Modos de execução</h2>

<ol start="3">
  <h3>Para rodar interativamente (esse modo as perguntas apareceram no terminal e você responda elas na hora):</h3> 
  <pre><code>?- iniciar.</code></pre>
  <p><strong>Dica:</strong> responda apenas com <code>s</code> ou <code>n</code> (sem ponto final).</p>
  <p>Responda todas as perguntas e veja o resultado obtido.</p>
</ol>
<ol start="3">
  <h3>Para testes com perfis prontos (usar arquivos com respostas prontas para fazer teste):</h3> 
<pre><code>?- rodar_teste('resposta1.pl').
?- rodar_teste('resposta2.pl').
?- rodar_teste('resposta3.pl').
</code></pre>
<p>Ou tudo de uma vez:</p>
<pre><code>?- rodar_todos.
</code></pre>
</ol>
