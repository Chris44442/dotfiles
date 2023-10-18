# Build Dockerimage on Bamboo

- create new repo on bitbucket, set ssh access keys if necessary
- on host pc clone repo
- add Dockerfile, bamboo.yaml, and certificates to repo, commit and push
- Bamboo administration -> Linked repositories -> add repo -> bitbucket server -> Select your repo
- disable checkbox "Enable repository caching on agents", set name, save repo
- go to bamboo project -> project settings -> bamboo specs repos add <your repo name>
- go to <your linked repo> in bamboo, enable scan for bamboo specs
- Specs status -> scan