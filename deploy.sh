#!/bin/sh
# Compila el deck y publica dist/ en la rama gh-pages.
set -e
REPO=ruts-piloto-validacion-2026-11-17
npx slidev build --base "/$REPO/"
touch dist/.nojekyll
cd dist
rm -rf .git
git init -q -b gh-pages
git add -A
git commit -q -m "Publica el deck"
git push -q -f "git@github.com:VManuelSM/$REPO.git" gh-pages
rm -rf .git
echo "Publicado: https://vmanuelsm.github.io/$REPO/"
