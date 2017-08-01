# deploy mongodb from binary
# prepare mongodb installation packages
MongoURI="https://fastdl.mongodb.org/linux"
MongoPackage="mongodb-linux-x86_64-3.0.6.tgz"

curl -O $MongoURI/$MongoPackage
tar -zxvf $MongoPackage
mv  mongodb-linux-x86_64-3.0.6/ /usr/local/mongodb
export PATH=/usr/local/mongodb/bin:$PATH

mkdir -p /data/db

mongod --fork --logpath=/tmp/mongod.out