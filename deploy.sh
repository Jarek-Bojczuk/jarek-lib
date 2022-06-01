#!/bin/bash

git config --global user.name "fdt-robot"

GIT_TAG=$(expr "0.0."$(echo $CIRCLE_BUILD_NUM))

export GIT_TAG
python setup.py bdist_wheel

git tag -a $GIT_TAG -m "release-$GIT_TAG"

twine upload --repository $PYPI_REPOSITORY --skip-existing dist/*

git push origin $GIT_TAG