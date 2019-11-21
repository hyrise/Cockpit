# Cockpit

## Running locally

You may need to install `pipenv`, and a different python version (e.g. using `pyenv`).
This can be done with the following commands.

```bash
brew install pipenv pyenv

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