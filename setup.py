from os import path

import setuptools
import os

PATH = path.abspath(path.dirname(__file__))

with open(path.join(PATH, 'README.md'), "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open(path.join(PATH, 'requirements.txt'), encoding='utf-8') as req_file:
    requirements = req_file.read().splitlines()

setuptools.setup(
    name="python-jarek-fdt-ci",
    version="0.0.1",
    author="Finance Tech",
    author_email="jarek.bojczuk@crypto.com",
    description="Test for a python library.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
    ],
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src"),
    python_requires=">=3.6",
    install_requires=[requirements],
)
