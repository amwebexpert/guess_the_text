# guess_the_text

Words guess game app

[![made-with-Markdown](https://img.shields.io/badge/Made%20with-Flutter-1389FD.svg)](http://flutter.dev) [![Flutter Responsive](https://img.shields.io/badge/flutter-responsive-brightgreen.svg?style=flat-square)](https://github.com/Codelessly/ResponsiveFramework)

Free educational app deployable on several native platforms: `Linux`, `Android`, `iOS` (iPhone, Tablets), Webapp, `MacOS`, and soon `Windows`. The application is an evolving educational game. The goal is to establish native development standards applied to a real world application deployed on production via the `Flutter` framework:
- app technical architecture, solution design and active development
- promote `Flutter` cookbook recipies and `Dart` language best patterns
- screen and animation design, theme, typography, dark mode, preferences, local persistence
- automated unit and behavioral tests, end to end tests, code coverage report
- evolutive structure of the source code, choice of open source libraries
- integration of `Rest` and/or `GraphQL` APIs
- dependencies injections pattern (`IoC`) for the whole application
- implementation of best practices, development guide, code reviews, training sessions

## Contributors

We are actually limiting the number of contributors (so dont take that personnaly) since this project:
- has to refine it's roadmap and goals
- we are in the process of adding a lot of assets to improve the onboarding process
- coding conventions have to be defined
- the developer documentation will be re-structured soon

## Some screen captures of the implemented features

start game | success | categories | custom chalenge | qr-code
------- | ---------- | ---------- | ---------- | ----------
<img src="store-presence/guess-the-text-01.jpg" /> | <img src="store-presence/guess-the-text-02.jpg" /> | <img src="store-presence/guess-the-text-04.jpg" /> | <img src="store-presence/create-a-challenge.jpg" /> | <img src="store-presence/qr-code-display.jpg" />


## Deployed on production

- [Google Play](https://play.google.com/store/apps/details?id=com.amwebexpert.app.guessthetext.guess_the_text)
- App Store
  - Not yet, will need to create an account and fill in all the forms and go through the approval process
- [Privacy Policy](https://amw-hangman-api.herokuapp.com/privacy-policy.html)
- [Webapp demo](https://amwebexpert.github.io/guess_the_text/)

## Coding standards

Guidelines for developers

* [Coding patterns](docs/sections/coding-standards/patterns.md)
* [Structure and naming](docs/sections/coding-standards/naming.md)
* [Store](docs/sections/coding-standards/store.md)
* [Tests](docs/sections/coding-standards/tests.md)

## BE Api (deployed on Heroku)

- https://amw-hangman-api.herokuapp.com/api/v1/categories
- https://amw-hangman-api.herokuapp.com/api/v1/categories/580b0004-d581-49d1-9c84-bddffdb5f3fd/texts


## Completed so far

List of demonstrated elements inside the codebase, divided by categories:

- [Covered subjects by categories](docs/sections/completed-subjects.md)


### Platforms support

The app supports multiple plateforms (more than just Android and iOS). See the list of supported platforms and how to add another platform

- [Supported platforms & builds](docs/sections/platforms-builds.md)

### Usefull VSCode & Flutter CLI operations

Running e2e tests, generating .g.dart files, coverages reports and many other commands

- [Usefull VSCode features & command line operations](docs/sections/usefull-commands.md)
