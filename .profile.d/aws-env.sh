function aws-development {
    $(gpg -o - ${HOME}/.aws-creds/development/environment.gpg)
}

function aws-uat {
    $(gpg -o - ${HOME}/.aws-creds/uat/environment.gpg)
}

function aws-production {
    $(gpg -o - ${HOME}/.aws-creds/production/environment.gpg)
}
