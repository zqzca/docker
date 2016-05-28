#!/usr/bin/env fish

pushd /mnt/code/zqz/back
rm -f zqz
make build
popd

pushd /mnt/code/zqz/front
ruby tools/build.rb
popd

rm -rf buildtmp
mkdir -p buildtmp/assets
cp -r /mnt/code/zqz/front/build/* buildtmp/assets
cp /mnt/code/zqz/back/zqz buildtmp/zqz

docker build -t dylanj/zqz .
docker push dylanj/zqz
