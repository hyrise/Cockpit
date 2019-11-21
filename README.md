# Cockpit

## Running locally

You may need to install [`pipenv`](https://github.com/pypa/pipenv#installation), and a different python version (e.g. using [`pyenv`](https://github.com/pyenv/pyenv#installation)).
This can be done with the following commands if you're on macOS.

```bash
brew install pipenv pyenv
```

If you're on a different operating system, please refer to the installation guides of [`pipenv`](https://github.com/pypa/pipenv#installation) and [`pyenv`](https://github.com/pyenv/pyenv#installation).

```bash
pyenv install 3.6.8

cd Cockpit
pyenv local 3.6.8
```

Run the following commands to bootstrap your environment.

```bash
cd Cockpit
pipenv install --dev
```

Please make sure you enable the pre-commit hooks:

```bash
pipenv run pre-commit install
```
