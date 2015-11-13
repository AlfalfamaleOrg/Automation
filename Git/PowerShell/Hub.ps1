# @file Git.ps1
#
# @author Danko Adamczyk <dankoadamczyk@me.com>
# @version 1.0.0
# For these commands you need to have https://hub.github.com/ installed.

. (Resolve-Path (Join-Path $PSScriptRoot "..\..\PowerShell\Prompts.ps1"))

# Create a Pull Request.

function pr{

    param(
		[String] $Base = 'develop'
	)

    if((ask('Do you want to create an Pull Request based on an existing issue?')) -eq 'y'){

        hub issue;

        $Issue = Read-Host -Prompt 'Please provide an issue number or press [s] to stop'

        if ($Issue -eq 's'){

            RETURN
        }

        if ($issue -gt 0){
        
            hub pull-request -b develop -i $Issue
        }
    }
    elseif((ask('Do you want to create a new Pull Request?')) -eq 'y'){

        hub pull-request -b $Base
    }

    if((ask('Do you want to view the branch on GitHub??')) -eq 'y'){

        # TODO: It would be great if we can directly access the PR instead of the branch.
        hub browse
    }
}