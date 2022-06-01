#!/bin/bash

git config --global user.name "FDT-CI"
git config --global user.email "fdt@crypto.com"

TAG=$(git tag | sort --version-sort | tail -n1)
echo $TAG

GIT_TAG=$(expr "0.0."$(echo $CIRCLE_BUILD_NUM))

export GIT_TAG
python setup.py bdist_wheel

git tag -a $GIT_TAG -m "release-$GIT_TAG"

twine upload --repository $PYPI_REPOSITORY --skip-existing dist/*

git push origin $GIT_TAG