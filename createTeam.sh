echo "Create a team"
curl \
  -X POST \
 -u devopstrainingblr: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 \
  https://api.github.com/orgs/mss-ec-junebatch/teams \
  -d '{"name":"testteambyGithubAPI","description":"A great team","permission":"push","privacy":"closed"}'