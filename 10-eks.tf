# Create IAM role for Amazon EKS cluster

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "myAmazonEKSClusterRole" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.myAmazonEKSClusterRole.name
}

# Create an Amazon EKS cluster

resource "aws_eks_cluster" "dwo-eks-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.myAmazonEKSClusterRole.arn
  version  = "1.24"

  vpc_config {
    subnet_ids = [
      aws_subnet.private_zone_1.id,
      aws_subnet.private_zone_2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}

output "endpoint" {
  value = aws_eks_cluster.dwo-eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.dwo-eks-cluster.certificate_authority[0].data
}

# Connect to k8s cluster
# aws eks --region us-east-1 update-kubeconfig --name my-eks --profile terraadmin
