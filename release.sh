-e
mkdir deploy
cd deploy
git clone https://github.com/tatematsu-k/sakurada_christmas_2020.git
cd sakurada_christmas_2020
AWS_PROFILE=sandbox jets deploy
cd ../..
rm -rf deploy

