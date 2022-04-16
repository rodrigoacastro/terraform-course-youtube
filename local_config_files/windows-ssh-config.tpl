add-content  -path c:users/Rodrigo/.ssh/config -value @'

Host ${hostname}
    Hostname ${hostname}
    User ${user}
    IdentityFile ${identityfile}
'@