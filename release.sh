-e
mkdir deploy
cd deploy
git clone https://github.com/tatematsu-k/sakurada_christmas_2020.git
cp ../.env.production.remote sakurada_christmas_2020/.env.production.remote
cd sakurada_christmas_2020
AWS_PROFILE=sandbox JETS_ENV=production jets deploy
cd ../..
rm -rf deploy
