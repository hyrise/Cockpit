# Hyrise Cockpit

![Backend Lint and Test](https://github.com/hyrise/Cockpit/workflows/Backend%20Lint%20and%20Test/badge.svg)
![Frontend Lint](https://github.com/hyrise/Cockpit/workflows/Frontend%20Lint/badge.svg)
![Docker Image CI](https://github.com/hyrise/Cockpit/workflows/Docker%20Image%20CI/badge.svg)
<a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>

## Quick Setup (Docker)

https://github.com/hyrise/Cockpit/wiki/Quick-Setup

## Full Setup (pipenv)

You may need to install a different python version (`3.8.3`, e.g. using [`pyenv`](https://github.com/pyenv/pyenv#installation)).
Installing pyenv can be done with the following commands:


<details>
<summary>macOS</summary>

```bash
brew install pyenv
```

</details>

<details>
<summary>Ubuntu</summary>

```bash
# Update package list
sudo apt-get update

# Dependencies commonly missing, causing issues with pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Pyenv install script
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

Put the following in your `.bashrc` (or `.zshrc`, etc.):

```bash
export PATH="/home/$USER/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Restart your shell:

```bash
exec "$SHELL"
```

</details>

Subsequently, the required version of Python can be installed and set with:

```bash
# Install Python 3.8.3
pyenv install 3.8.3

# Set the local (directory) Python version to 3.8.3
cd Cockpit
pyenv local 3.8.3
```
Since there is a dependency for [`psycopg2`](http://initd.org/psycopg/docs/install.html), you may need to run the following commands:

<details>
<summary>macOS</summary>

```bash
brew install libpq postgresql
```

</details>

<details>
<summary>Ubuntu</summary>

```bash
sudo apt-get install libpq-dev
```

</details>

Now, initialize and sync your virtual environment:

```bash
python -m pip install pipenv
exec "$SHELL"
pipenv --three --python=`which python`
pipenv sync
```

### Developer setup

Run the following commands to bootstrap your developer environment.

```bash
pipenv sync --dev

# Please make sure you enable the pre-commit hooks:
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

The id of the hook can be found in the [`.pre-commit-config.yaml`](.pre-commit-config.yaml) file.

##### Running hooks on all files

You can run all the pre-commit hooks on all files by running:

```bash
pipenv run pre-commit run --all-files
```

### Tests

You can run all tests with:

```bash
pipenv run pytest
```
