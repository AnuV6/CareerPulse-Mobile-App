# Steps to work with Original repo: (For all team members.)

Fetch Updates from the Main Repository:

    - Before starting any work, fetch any changes made in the original repository to stay up-to-date:
                git fetch upstream
                git checkout main
                git merge upstream/main

Create a New Branch for Your Changes:

    - Create a new branch for each feature or bug fix (good practice)
            
            git checkout -b feature-branch-name

Make Changes Locally:

    - Start making your changes to the Flutter app locally using your preferred IDE.

Commit Changes:

    
    - Stage your changes for commit
            
            git add .

    - Commit the changes with a descriptive message

            git commit -m "Brief description of your changes"


Push Changes to Your Forked Repository:

    - Push your local changes to your forked repository on GitHub

            git config --global --add safe.directory C:/src/development/CareerPulse/CareerPulse-Mobile-App-Frontend

            git remote add upstream https://github.com/AnuV6/CareerPulse-Mobile-App.git


</> Then anupa will make the Pull request in main branch. Make sure push your update after all done that time and after back to the work you have to sync back.


    


