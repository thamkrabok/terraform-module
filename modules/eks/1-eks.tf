# resource "aws_iam_role" "eks" {
#   name = "${var.env}-${var.eks_name}-eks-cluster"

#   assume_role_policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "Service": "eks.amazonaws.com"
#             },
#             "Action": "sys:AssumeRole"
#         }
#     ]
# }
# POLICY
# }

resource "aws_iam_role_policy_attachment" "eks" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role        = var.cicdadm
}

resource "aws_eks_cluster" "this" {
    name        = "${var.env}-${var.eks_name}"
    version     = var.eks_version
    role_arn    = var.arncicdadm

    vpc_config {
      endpoint_private_access = false
      endpoint_public_access = true

      subnet_ids = var.subnet_ids
    }

    depends_on = [ aws_iam_role_policy_attachment.eks ]
}