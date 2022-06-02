#!/bin/bash

git config --global user.name "FDT-CI"
git config --global user.email "fdt@crypto.com"

TAG=$(git tag | sort --version-sort | tail -n1)

if [ -z "$TAG" ]; then
  TAG="0.0.0"
fi

case $PUSH_TYPE in
  patch)
    GIT_TAG=$(echo $TAG | cut -d'.' -f1)"."$(echo $TAG | cut -d'.' -f2)"."$(expr $(echo $TAG | cut -d'.' -f3) + 1)
    ;;
  minor)
    GIT_TAG=$(echo $TAG | cut -d'.' -f1)"."$(expr $(echo $TAG | cut -d'.' -f2) + 1)".0"
    ;;
  major)
    GIT_TAG=$(expr $(echo $TAG | cut -d'.' -f1) + 1)".0.0"
    ;;
esac

export GIT_TAG
python setup.py bdist_wheel

git tag -a $GIT_TAG -m "release-$GIT_TAG"

twine upload --repository $PYPI_REPOSITORY --skip-existing dist/*

git push origin $GIT_TAG