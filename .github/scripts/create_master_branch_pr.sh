#!/bin/bash

echo "Starting workflow..."

if [ "${{ github.event.pull_request.merged }}" == "true" ] && [ "${{ github.event.pull_request.base.ref }}" == "stage" ]; then
    
    # Extract the PR number and URL from the merged pull request
    PR_NUMBER="${{ github.event.pull_request.number }}"
    PR_URL="${{ github.event.pull_request.html_url }}"
    echo "PR_NUMBER: $PR_NUMBER"

    # Fetch latest changes
    git fetch origin master
    
    # Switch to the 'master' branch
    git checkout master

    # Create a new branch for the master branch, including the PR number
    git checkout -b master-branch-update-from-stage-pr-${PR_NUMBER} origin/master

    # Fetch the changes from the closed pull request
    echo "Fetching changes from PR #$PR_NUMBER..."
    git fetch origin pull/${PR_NUMBER}/head:${PR_NUMBER}-pr-changes
    git merge ${PR_NUMBER}-pr-changes

    # Push the changes to the repository
    echo "Pushing the changes to master-branch-update-from-stage-pr-${PR_NUMBER}..."
    git push origin master-branch-update-from-stage-pr-${PR_NUMBER}

    # Create a pull request with the PR number in the title
    echo "Creating the PR to master branch with branch name as master-branch-update-from-stage-pr-${PR_NUMBER}..."
    gh pr create --base master --head master-branch-update-from-stage-pr-${PR_NUMBER} --title "Merge changes from 'stage' to 'master' (PR #$PR_NUMBER)" --body "This PR includes changes from stage PR: $PR_URL"
fi

echo "Workflow completed successfully."
