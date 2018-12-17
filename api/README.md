# Exemplo WebService REST

A aplicação realiza as seguintes tarefas:

+ Envia a sonda para a posição inicial (x = 0, y =0 e frente da sonda virada para direita) atrav'es de um m'etodo POST para /start

+ Mostra a posi'c~ao atual da sonda atrav'es de um m'etodo GET para /position

+ Recebe uma sequencia de movimentos e mostra as coordenadas da posicao final atraves do metodo PUT para /move.json

## Instruções
&nbsp;
#### Requisitos ####

- [ ] Instalar ruby 2.5.3

- [ ] Ferramenta para teste de API que possa operar com cookies 

&nbsp;

#### Aplicação ####

- [ ] Baixar os arquivos deste repositorio

- [ ] Acessar a pasta 'api'

- [ ] Rodar no terminal o comando 

```bash
$ bundle
```

- [ ] Rodar no terminal o comando

```bash
$ rails s
```


## Funcionamento esperado

#### 1. /POST ####

+ Ao realizar o POST /start , o retorno é um body em branco com indicaçao de sucesso no cabeçalho
&nbsp;


#### 2. /GET ####

+ Ao realizar o GET /position, o retorno experado 'e um JSON com as seguintes informaç~oes:
&nbsp;

```json

{
  "x": 0,
  "y": 0,
  "face": :D
}
```

#### 3. /PUT ####

+ Para realizar o PUT /move.json, 'e necessario enviar o seguinte parametro:

| **Parâmetro** | **Descrição** | **Tipo** | **Regra** |
| ------------- | ------------- | ----------- | --------- |
| movimentos | Movimentos que a sonda pode realizar | Array | Valores possíveis: "GE" / "GD" / "M" |
&nbsp;

+ Abaixo um exemplo de preenchimento do parametro "movimentos"

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

- [ ] Use o [Postman](https://www.getpostman.com/) para testar a aplicação;
&nbsp;

- [ ] Para enviar a sonda para posiç~ao inicial, faça um /POST para localhost:3000/start
&nbsp;
- [ ] Para verificar a posicao da sonda, faça um /GET para localhost:3000/position
&nbsp;
- [ ] Para mover sonda, faça um /PUT para localhost:3000/move.json com o parametro 'movimentos'
&nbsp;
