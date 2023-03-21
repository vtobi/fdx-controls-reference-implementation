######################################
#AWS
######################################
provider "aws" {
    region     = local.aws_region
}
provider "kubernetes" {
    host = local.host
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
    token = data.aws_eks_cluster_auth.auth.token
}
provider "helm" {
    kubernetes {
        host = local.host
        cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
        token = data.aws_eks_cluster_auth.auth.token  
    }
}
#######################################
#GCP
#######################################


provider "kubernetes" {
    host = local.host
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
    token = data.aws_eks_cluster_auth.auth.token
}
provider "helm" {
    kubernetes {
        host = local.host
        client_certificate
        client_key
        cluster_ca_certificate = base64decode(local.cluster_ca_certificate) 
    }
}
