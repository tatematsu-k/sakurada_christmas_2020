-e
mkdir deploy
cd deploy
git clone https://github.com/tatematsu-k/sakurada_christmas_2020.git
cp .env.development.remote sakurada_christmas_2020/.env.development.remote
cd sakurada_christmas_2020
AWS_PROFILE=sandbox jets deploy
cd ../..
rm -rf deploy

