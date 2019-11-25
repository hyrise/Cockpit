# Hyrise Cockpit

## Setup

You may need to install [`pipenv`](https://github.com/pypa/pipenv#installation), and a different python version (`3.6.8`, e.g. using [`pyenv`](https://github.com/pyenv/pyenv#installation)).
This can be done with the following commands if you're on macOS.

```bash
brew install pipenv pyenv
```

If you're on a different operating system, please refer to the installation guides of [`pipenv`](https://github.com/pypa/pipenv#installation) and [`pyenv`](https://github.com/pyenv/pyenv#installation), and make sure that you have the [prerequisites for `pyenv`](https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites) installed.

```bash
pyenv install 3.6.8

cd Cockpit
pyenv local 3.6.8
```

Run the following commands to bootstrap your environment.

```bash
cd Cockpit
pipenv install
```

### Developer setup

Run the following commands to bootstrap your developer environment.

```bash
cd Cockpit
pipenv install --dev
```

Please make sure you enable the pre-commit hooks:

```bash
pipenv run pre-commit install
```

#### [`pre-commit`](https://github.com/pre-commit/pre-commit) hooks

If you want to run the pre-commit hooks manually without commiting, simply run:

```bash
pipenv run pre-commit
```

This will trigger all configured pre-commit hooks, most notably:

- Python utility [`isort`](https://github.com/timothycrosley/isort), to sort imports alphabetically, and automatically separated into sections.
- Python code formatter [`black`](https://github.com/psf/black).
  Blackened code looks the same regardless of the project you're reading.
  Formatting becomes transparent after a while and you can focus on the content instead.
- Python utility [`flake8`](https://github.com/PyCQA/flake8), with plugins [`pep8-naming`](https://github.com/PyCQA/pep8-naming) and [`flake8-bugbear`](https://github.com/PyCQA/flake8-bugbear).
- Python utility [`pydocstyle`](https://github.com/PyCQA/pydocstyle), a static analysis tool for checking compliance with Python docstring conventions.
- Python utility [`bandit`](https://github.com/PyCQA/bandit), a tool designed to find common security issues in Python code.

##### Failing hooks

If some hooks fail, you will not be able to commit.
You may bypass this by using the `git commit --no-verify`, but it's a good practice to avoid bypassing it.
Instead, add the edits made by e.g. `isort` or `black` to the staging area, and commit with the pre-commit hooks passing.
Some hooks, however, require you to change files manually, e.g. `flake8` warning you of an unused variable.

##### Running a specific hook

You can run a single hook by running:

```bash
pipenv run pre-commit hook-id
```

The id of the hook can be found in the [`.pre-commit-confing.yaml`](.pre-commit-config.yaml) file.

##### Running hooks on all files

You can run all the pre-commit hooks on all files by running:

```bash
pipenv run pre-commit run --all-files
```

