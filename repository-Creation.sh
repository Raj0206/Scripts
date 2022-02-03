#!/usr/bin/bash

# Add GitHub Personal Access Token (PAT)
GH_API_TOKEN=PAT

# Add GitHub Organization Name
GH_ORG_NAME=Org-Name

# Add team id (tech-leads)
Team_Id1=5631993

# Add team id (TEC0168)
Team_Id2=5632385

# Input file
INPUT=input.csv

while read line || [ -n "$line" ]
do
	reponame=$(echo "$line" | sed -e 's/\r//g') 
	
	curl -s -X POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_API_TOKEN}" "https://api.github.com/orgs/${GH_ORG_NAME}/repos" -d '{"name":"'"$reponame"'", "visibility":"private"}'
	
	curl -s -X PUT  -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_API_TOKEN}" "https://api.github.com/repos/${GH_ORG_NAME}/${reponame}/contents/README.md"   -d '{"message":"Initial Commit", "content":"IyBSRUFETUU="}'
	
	curl -s -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_API_TOKEN}" "https://api.github.com/teams/${Team_Id1}/repos/${GH_ORG_NAME}/${reponame}" -d '{"permission":"push"}'	

	curl -s -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_API_TOKEN}" "https://api.github.com/teams/${Team_Id2}/repos/${GH_ORG_NAME}/${reponame}" -d '{"permission":"admin"}'
	
	curl -s -X PUT  -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_API_TOKEN}" "https://api.github.com/repos/${GH_ORG_NAME}/${reponame}/branches/master/protection"   -d '{"required_status_checks":null,"enforce_admins":null,"required_pull_request_reviews":{"dismiss_stale_reviews":false,"require_code_owner_reviews":false,"required_approving_review_count":2},"restrictions":{"users":["null"],"teams":["tech-leads"]}}'
	
done < "$INPUT"
