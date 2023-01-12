"""An AWS Python Pulumi program"""
# https://github.com/pulumi/examples/tree/master/aws-py-ec2-provisioners
# https://www.pulumi.com/registry/packages/aws/how-to-guides/ec2-webserver/

# Connect via SSH:
# ssh -i "rsa" ec2-user@ec2-34-245-163-159.eu-west-1.compute.amazonaws.com

import pulumi
import pulumi_aws as aws
import pulumi_command as command
import base64

config = pulumi.Config()

# If keyName is provided, an existing KeyPair is used, else if publicKey is provided a new KeyPair
# derived from the publicKey is created.
key_name = config.get('keyName')
public_key = config.get('publicKey')

def decode_key(key):
    try:
        key = base64.b64decode(key.encode('ascii')).decode('ascii')
    except:
        pass
    if key.startswith('-----BEGIN RSA PRIVATE KEY-----'):
        return key
    return key.encode('ascii')

private_key = config.require_secret('privateKey').apply(decode_key)

size = 't2.micro'
ami = aws.ec2.get_ami(most_recent="true",
        owners=["137112412989"],
        filters=[{"name":"name","values":["amzn-ami-hvm-*"]}])

# Create a new security group that permits SSH and web access.
secgrp = aws.ec2.SecurityGroup('secgrp',
        description='SSH and Webserver access',
        ingress=[
            aws.ec2.SecurityGroupIngressArgs(protocol='tcp', from_port=22, to_port=22, cidr_blocks=['0.0.0.0/0']),
            aws.ec2.SecurityGroupIngressArgs(protocol='tcp', from_port=80, to_port=80, cidr_blocks=['0.0.0.0/0']),
            ],
        )

if key_name is None:
    key = aws.ec2.KeyPair('key', public_key=public_key)
    key_name = key.key_name

server = aws.ec2.Instance('adr-webserver-www',
        instance_type=size,
        key_name=key_name,
        vpc_security_group_ids=[secgrp.id], # reference security group from above
        ami=ami.id)

connection = command.remote.ConnectionArgs(
    host=server.public_ip,
    user='ec2-user',
    private_key=private_key,
)

cp_config = command.remote.CopyFile('config',
    connection=connection,
    local_path='myapp.conf',
    remote_path='myapp.conf',
    opts=pulumi.ResourceOptions(depends_on=[server]),
)

pulumi.export('publicIp', server.public_ip)
pulumi.export('publicHostName', server.public_dns)
