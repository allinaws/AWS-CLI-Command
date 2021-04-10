#!/usr/bin/env bash
#



# 查看单个路由表信息
aws ec2 describe-route-tables --route-table-ids rtb-257a9743

# routeTable(){
#aws vpc route table
# aws ec2 describe-route-tables \
# --filters "Name=tag-key,Values=Name"  \
# --query 'RouteTables[*].{RouteTableId:RouteTableId,Routes:Routes.Tags.DestinationCidrBlock,Subnets:association.subnet-id}' \
# --output table
# }
#
# routeTable
#
#
# aws ec2 describe-route-tables \
# --route-table-ids rtb-257a9743 \
# --filters "Name=tag-key,Values=Name"  \
# --query 'RouteTables[*].{RouteTableId:RouteTableId,Routes:Routes.Tags.DestinationCidrBlock,Subnets:association.subnet-id}' \
# --output table
# }


#aws ec2 describe-route-tables \
#--route-table-ids rtb-257a9743 \
#--query 'RouteTables[*].{RouteTableId:RouteTableId,SubnetId:Associations.SubnetId,CPRD:Routes.DestinationCidrBlock}' \
#--output table

# aws ec2 describe-route-tables \
# --route-table-ids rtb-257a9743 \
# --filters "Name=tag-key,Values=Name"  \
# --query 'RouteTables[*].{RouteTableId:RouteTableId,SubnetId:Associations.SubnetId}' \
# --output table

# aws ec2 describe-route-tables \
# --route-table-ids rtb-257a9743 \
# --filters "Name=tag-key,Values=Name"  \
# --query '{sub:RouteTables.Associations.SubnetId}' \
# --output table
