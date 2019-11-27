my_path=$(cd `dirname $0`;pwd)
my_path=`dirname $my_path`
echo $my_path


# -o 指定 order节点
# -c 指定通道名
# -f 指定配置文件
# -tls 与order通信开启tls
# -cafile 使用tls时，使用的orderer证书
opts="-o order2.example.com:7050"
opts="$opts -c mychannel2"
opts="$opts -f $my_path/channel-artifacts/mychannel2.tx"
opts="$opts --tls --cafile $my_path/crypto/ordererOrganizations/example.com/orderers/order2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel create $opts