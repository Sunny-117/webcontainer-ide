npm run build
cd dist
git init
git add .
git commit -m 'deploy'
git push -f https://github.com/Sunny-117/web-container-ide.git main:gh-pages
