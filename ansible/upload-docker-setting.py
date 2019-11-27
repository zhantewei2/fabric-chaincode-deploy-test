import subprocess
import sys

remote_workspace="/root/downloads/fabric-samples/kafka_cluster"
file_names=("docker-compose-up.1.yaml","docker-compose-up.2.yaml","docker-compose-up.3.yaml")
ips=["192.168.1.226","192.168.1.227","192.168.1.228"]



def run(file_name,ip):
    global remote_workspace
    subprocess.Popen(
        f"scp lib/docker/{file_name} root@{ip}:/{remote_workspace}/docker-compose-up.yaml",
        shell=True
    )
    print(f"{file_name}: {ip}")

various=sys.argv[1] if len(sys.argv)>1 else None

if various:
    various=int(various)-1
    run(file_names[various],ips[various])
else:
    for i in range(len(file_names)):
        run(file_names[i],ips[i])