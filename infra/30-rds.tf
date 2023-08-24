resource "aws_security_group" "db" {
  name        = "us-unicorn-sg-db"
  description = "Allow database traffic"
  vpc_id      = aws_vpc.main.id
}

resource "aws_db_subnet_group" "db" {
  name = "us-unicorn-db-subnets"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id,
    aws_subnet.private_c.id
  ]
}

resource "aws_rds_cluster" "db" {
  cluster_identifier          = "us-unicorn-mysql-cluster"
  database_name               = "unicorn"
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  db_subnet_group_name = aws_db_subnet_group.db.name
  master_username             = "us-unicorn"
  manage_master_user_password = true
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot = true
  storage_encrypted = true
  engine = "aurora-mysql"
}

resource "aws_rds_cluster_instance" "db" {
  count = 3
  cluster_identifier = aws_rds_cluster.db.id
  instance_class         = "db.r6g.large"
  identifier             = "us-unicorn-db-${count.index}"
  engine = "aurora-mysql"
}
