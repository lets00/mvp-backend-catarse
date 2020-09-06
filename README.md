# mvp-backend-catarse

Esse projeto implementa o backend do catarsinho (um serviço simplificado do catarse). As regras de negócio são especificadas abaixo:

## Regras de negócio (In portuguese)

Permitir que o usuário cadastre um projeto com as seguintes informações, todas obrigatórias:

1. Título com até 64 caracteres.
    * Descrição com até 512 caracteres.
    * Imagem do projeto.
    * Meta de arrecadação (que deve ser maior que 0 e no máximo 500 reais).
    * Data de encerramento da campanha (validar que a data é maior que a data atual e menor que a data atual + 30 dias).
2. Permitir que o usuário atualize ou apague um projeto.
3. Implementar uma listagem com os projetos cadastrados
4. Implementar sistema de login.
5. Permitir que o usuário apoie um projeto.
    * Não é necessário integrar com nenhum meio de pagamento, apenas um registrar o valor do apoio do usuário para aquele projeto.
    * O valor do apoio deve ser maior que 0 reais.
6. Implementar página do projeto exibindo as informações do projeto e valor arrecadado.
7. Mostrar na página do projeto os usuários que apoiaram o projeto.
8. Impedir que usuários apaguem ou atualizem projetos que não são deles.
9. Na listagem de projetos permitir que o usuário pesquise um projeto pelo título do projeto.
10. Na listagem de projetos permitir que o usuário ordene o projeto pelos seguintes campos: título, meta de arrecadação e data de encerramento da campanha.
11. Não permitir que um projeto seja apoiado após a data de encerramento da campanha.

## How to run

First, you must have installed on your computer **docker** and **docker-compose**.
After that, executes:

```sh
$ docker-compose up -d
```

To create and populate tables, Run the command bellow:
```sh
$ rake db:create db:migrate db:seed
```
## Routes

This default endpoint is formed by: http://localhost:4000/v1/

The main 4 routes are:
* /project
* /user
* /login
* /support

## Project route

### GET

#### Project
* http://localhost:4000/v1/project/:id : Returns a specific project.
* http://localhost:4000/v1/project?title=hi&limit=10&skip=10 : Returns a specific project by title. You can limit the number of elements and skip some blocks.

#### User
* http://localhost:4000/v1/user/:id : Returns a user informations.
* http://localhost:4000/v1/user/:id/projects : Returns all projects create by an user.
* http://localhost:4000/v1/user/:id/supports : Returns all supports(donations) create by an user.

#### Support
* http://localhost:4000/v1/support/:id : Returns all supports by project id.

### POST
#### Projects
* http://localhost:4000/v1/project: Create a new project. You must pass on HTTP Request Header the Autorization project. Ex:
```js
Authorization: Bearer <jwt>
```

You must pass as JSON in http request body the specifics informations:
* title: Project's name
* description: Description's project
* image_url: Image's URL
* goal: Goal's project
* finnish_date: Timestamp to finnish project

Ex:
```json
{
 "title": "A super project",
 "description": "An simple test...",
 "image_url": "http://www.google.com",
 "goal": 100,
 "finnish_date": "2020-11-01T20:03:02.185Z"
}
```

#### Login
* http://localhost:4000/v1/login : Obtains a new token used to POST/PUT/DELETE projects and POST supports. HTTP-request json body:

```json
{
	"username": "lets00",
	"password": "asdf123"
}
```

**For tests purposes, you can use lets00 or lets01 users. the passowrd is asdf123.**

### PUT

#### Project
* http://localhost:4000/v1/project/:id : Updates a specific project. You must pass on HTTP Request Header the Autorization project. You must pass as JSON in http request one or all this specifics informations.
Ex:
```json
{
 "goal": 200
}
```

### DELETE
#### Project
* http://localhost:4000/v1/project/:id : Remove a specific project. You must pass on HTTP Request Header the Autorization project.
