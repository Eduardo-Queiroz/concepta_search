# Challenge Concepta

Challenge Concepta is a model application with fluid animations, popular architectures and a good code coverage

## Maestro Demo

![](maestro_demo.gif)

## Decicoes

I used patterns and libs that in my perception were most applicable to the demonstrated challenge that has multiple data sources and complex animations

| Lib ou padrao | Aplicação do conceito                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------- |
| Clean Arch    | A popular way to organize applications with multiple data sources.                                                  |
| Bloc          | A solution for generating predictable state-based animations with pure functions and interacting between components |
| Hive          | Persistence solution with virtualization to speed up queries for small db.                                          |
| get_it        | Solution to reduce coupling, facilitate the implementation of unit tests and generate dependency inversion.         |

#### Testes

Even not having a wide variety of tests they provide great coverage of the code and ensuring quality.

| Teste           | Aplicação do conceito                                                                         |
| --------------- | --------------------------------------------------------------------------------------------- |
| E2E             | I use maestro for black box testing                                                           |
| Widget (custom) | I use internal utilities to create tests that have high code coverage even with few scenarios |

## Configurando o ambiente de desenvolvimento

Follow the steps in the link: https://docs.flutter.dev/get-started/install

## Para começar

Install project dependencies

```sh
flutter pub get
```

And run the command to start the application

```sh
flutter run
```

## Testes automatizados

### Configurando o ambiente de testes e2e

Follow the steps in the link: https://maestro.mobile.dev/getting-started/installing-maestro

#### Testes e2e (maestro)

(e2e tests require an active emulator or simulator)

Run the command to run the e2e tests

```sh
maestro test -c test/e2e/flow_compose.yml
```

#### Testes de widget

To run the widget tests run the command

```sh
flutter test
```

## License

MIT

**Eduardo Queiroz (eduqueiroz21@gmail.com)**

[//]: # "These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax"
