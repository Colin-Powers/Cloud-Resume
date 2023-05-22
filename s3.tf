# create www bucket
resource "aws_s3_bucket" "wwwBucket" {
  bucket = "www.${var.bucket_name}"

  tags = var.common_tags

}

# make the www bucket public 
resource "aws_s3_bucket_public_access_block" "wwwPublic" {
  bucket = aws_s3_bucket.wwwBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

# set up web hosting on the www bucket
resource "aws_s3_bucket_website_configuration" "wwwConfig" {
  bucket = aws_s3_bucket.wwwBucket.id

  index_document {
    suffix = "index.html"
  }

}

# resource to add policy to www bucket
resource "aws_s3_bucket_policy" "wwwPolicy" {
  bucket = aws_s3_bucket.wwwBucket.id
  policy = data.aws_iam_policy_document.public_read_access.json
}

#DataSource to generate a policy document to allow getobject
data "aws_iam_policy_document" "public_read_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.wwwBucket.arn,
      "${aws_s3_bucket.wwwBucket.arn}/*",
    ]
  }
}

# create root bucket that will redirect traffic to the www bucket
resource "aws_s3_bucket" "rootBucket" {
  bucket = var.bucket_name

  tags = var.common_tags

}

# set up the redirect on root bucket
resource "aws_s3_bucket_website_configuration" "rootConfig" {
  bucket = aws_s3_bucket.rootBucket.id

  redirect_all_requests_to {
    host_name = aws_s3_bucket.wwwBucket.id
    protocol  = "https"
  }

}