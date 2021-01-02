-e
mkdir deploy
cd deploy
git clone https://github.com/tatematsu-k/sakurada_christmas_2020.git
cp ../.env.production.remote sakurada_christmas_2020/.env.production.remote
cd sakurada_christmas_2020
AWS_PROFILE=sandbox JETS_ENV=production SECURITY_GROUP_IDS=sg-07544e143de07134f SUBNET_IDS=subnet-0f2b297ed57931135,subnet-0a7eb6c8633fd139d jets deploy
cd ../..
rm -rf deploy
