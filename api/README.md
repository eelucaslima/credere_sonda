# Exemplo WebService REST

A aplicação realiza as seguintes tarefas:

+ Envia a sonda para a posição inicial (x = 0, y =0 e frente da sonda virada para direita) através de um método POST /start

+ Mostra a posição atual da sonda através de um método GET /position

+ Recebe uma sequência de movimentos e mostra as coordenadas da posição final através do método PUT /move.json

&nbsp;
## Instruções

#### Requisitos ####

- [ ] Instalar ruby 2.5.3

- [ ] Ferramenta para teste de API que possa operar com cookies 

&nbsp;
#### Aplicação ####

- [ ] Baixar os arquivos deste repositório

- [ ] Acessar a pasta 'api'

- [ ] Rodar o comando

```bash
$ bundle
```

- [ ] Rodar o comando

```bash
$ rails s
```
&nbsp;
## Funcionamento esperado

#### 1. /POST ####

+ Ao realizar o POST /start , o retorno é um body em branco com indicação de sucesso no cabeçalho
&nbsp;


#### 2. /GET ####

+ Ao realizar o GET /position, o retorno experado é um JSON com as seguintes informações:
&nbsp;

```json

{
  "x": 0,
  "y": 0,
  "face": :D
}
```

#### 3. /PUT ####

+ Para realizar o PUT /move.json, é necessário enviar o seguinte parâmetro:

| **Parâmetro** | **Descrição** | **Tipo** | **Regra** |
| ------------- | ------------- | ----------- | --------- |
| movimentos | Movimentos que a sonda pode realizar | Array | Valores possíveis: "GE" / "GD" / "M" |
&nbsp;

+ Abaixo um exemplo de preenchimento do parâmetro "movimentos"

```json
{
  "movimentos": ["GE", "M", "GD"]
}
```
&nbsp;

+ Ao realizar o PUT /move.json , o retorno esperado é um Json. Abaixo um exemplo deste retorno:
&nbsp;

```json
{
    "x": 0,
    "y": 1,
}
```
&nbsp;
## Testando a aplicação

- [ ] Use o [Advanced REST client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo) para testar a aplicação;
&nbsp;

- [ ] Para enviar a sonda para posição inicial, faça um /POST para http://localhost:3000/start
&nbsp;
- [ ] Para verificar a posição da sonda, faça um /GET para http://localhost:3000/position
&nbsp;
- [ ] Para mover sonda, faça um /PUT para http://localhost:3000/move.json escrendo no Body da requisição:
```
{ "movimentos": [ "GE", "M" ] }
```
&nbsp;
