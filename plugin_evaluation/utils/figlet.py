"""Module for figlet welcome message."""
from pathlib import Path

absolute_directory_path = str(Path(__file__).parent.absolute())

with open(f"{absolute_directory_path}/figlet.txt", "r") as f:
    intro: str = f.read()
