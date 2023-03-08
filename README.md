# Challenge Concepta

Challenge Concepta is a model application with fluid animations, popular architectures and a good code coverage

## Maestro Demo


https://user-images.githubusercontent.com/37419591/223831752-5a771d5b-3416-4526-8a34-80bc29b6d14d.mov


## Motivations

I used patterns and libs that in my perception were most applicable to the demonstrated challenge that has multiple data sources and complex animations

| Lib or pattern | Motivation                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------- |
| Clean Arch    | A popular way to organize applications with multiple data sources.                                                  |
| Bloc          | A solution for generating predictable state-based animations with pure functions and interacting between components |
| Hive          | Persistence solution with virtualization to speed up queries for small db.                                          |
| get_it        | Solution to reduce coupling, facilitate the implementation of unit tests and generate dependency inversion.         |

#### Tests

Even not having a wide variety of tests they provide great coverage of the code and ensuring quality.

| Tests           | Motivation                                                                        |
| --------------- | --------------------------------------------------------------------------------------------- |
| E2E             | I use maestro for black box testing                                                           |
| Widget (custom) | I use internal utilities to create tests that have high code coverage even with few scenarios |

## Setting up the development environment

Follow the steps in the link: https://docs.flutter.dev/get-started/install

## Get Start

Install project dependencies

```sh
flutter pub get
```

And run the command to start the application

```sh
flutter run
```

## Automated tests

### Setting up the e2e test environment

Follow the steps in the link: https://maestro.mobile.dev/getting-started/installing-maestro

#### E2E Tests (maestro)

(E2E tests require an active emulator or simulator)

Run the command to run the E2E tests

```sh
maestro test -c test/e2e/flow_compose.yml
```

#### Widget Tests

To run the widget tests run the command

```sh
flutter test
```

## License

MIT

**Eduardo Queiroz (eduqueiroz21@gmail.com)**

[//]: # "These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax"
