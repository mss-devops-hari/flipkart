echo "Creating the repo..."


curl \
  -X POST \
  -u devopstrainingblr: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 \
  https://api.github.com/orgs/mss-ec-junebatch/repos \
  -d '{"name":"Flipkart-GitHubAPI","description":"This is your first repository","homepage":"https://github.com","private":true,"has_issues":true,"has_projects":true,"has_wiki":true}'
  



