# Script

 This script can be used to create multiple repositories, adding collaborators, and creating branch protection rules.
 
**Step 1:** Add Personal Access Token (PAT), Organization Name, and Team ID to the **Repository-Creation.sh** file

  ![image](https://user-images.githubusercontent.com/78465059/152372620-14e51c3c-35d8-457c-a5c7-e09e41ed43e6.png)
  
**Step 2:** How to find a GitHub Team ID
    
Open a shell or Command Prompt. In the shell or Command Prompt type by replacing the ![image](https://user-images.githubusercontent.com/78465059/152374108-f84f985e-85a3-4a3a-b331-94101a1b0a6f.png)
 with the actual access token and ![image](https://user-images.githubusercontent.com/78465059/152374175-552ddf38-6948-47f0-83e4-42acae371e26.png)
 with the organization’s name. On Windows I had to use double quotes (“) but maybe on Unix/Linux systems single quotes (‘) are presumed.
 
 `curl -H "Authorization: token <very-long-access-token>" https://api.github.com/orgs/<org-name>/teams`
 
 ![image](https://user-images.githubusercontent.com/78465059/152374698-edd339a7-6e05-4bc5-a334-0fa3148ff409.png)

 Of course your output might differ a little bit, just look for the ID "id":  5632385 in TEC0168.

**Step 3:** Add your Repositories Name to the **input.csv** file.

 ![image](https://user-images.githubusercontent.com/78465059/152372827-37a95c23-910f-47fa-b243-aff02829e735.png)
 
 
 **Step 4:** Execute Shell Script Files
 
  - Open Shell or Command Prompt and navigate to the folder where the script file is available.
  - Type Bash **Repository-Creation.sh** and hit the enter key.
  - It will run the script and show you the results.
