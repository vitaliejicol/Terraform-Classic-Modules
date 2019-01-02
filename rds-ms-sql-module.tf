module "rds-ms-sql" {
  source = "./modules/rds-ms-sql"

  region = "eu-west-2"
  identifier = "Cloudelligent-db-app2-dev"
  final-snapshot-identifier = "Cloudelligent-db-final-snap-shot-1"
  rds-allocated-storage = "20"
  rds-engine = "sqlserver-ex"
  engine-version = "14.00.3035.2.v1"
  db-instance-class = "db.t2.micro"
  backup-retension-period = "0"
  backup-window = "04:00-06:00"
  publicly-accessible = "false"
  rds-username = "demo"
  rds-password = "thisisjustademo"

  vpc-security-group-ids = "${module.rds-sg.aws-security-group-rds}"
  rds-private-subnets-groups-name = "Cloudelligent-rds-private-subnets-group"
  rds-private-subnets-groups-description = "Allowed Only Private Subnets for Cloudelligent-RDS-MYSQL"
  aws-db-subnet-group-private-subnets = "${module.vpc.private-subnet-ids}"
  name-aws-db-subnet-group = "Cloudelligent-rds-subnets-groups"
}