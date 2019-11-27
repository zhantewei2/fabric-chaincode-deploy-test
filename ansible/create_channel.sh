#  order2 中创建 order1的通道
#   该文件放置于 channel-artifacts中
#   在 容器cli 中执行
#
#
#



my_path=$(cd `dirname $0`;pwd)
my_path=`dirname $my_path`
echo $my_path
opts="-o order1.example.com:7050"
opts="$opts -c mychannel"
opts="$opts -f $my_path/hannel-artifacts/mychannel.tx"
opts="$opts --tls --cafile $my_path/crypto/ordererOrganizations/example.com/orderers/order1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel create $opts