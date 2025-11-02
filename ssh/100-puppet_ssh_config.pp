# 100-puppet_ssh_config.pp

# Puppet manifest to configure the SSH client for password-less, key-only authentication.

# Target the global SSH client configuration file.
# Note: On many systems, the main configuration file is /etc/ssh/ssh_config.
# We will use /etc/ssh/ssh_config as the default target.

# Ensure password authentication is disabled (required: refuse to authenticate using a password)
file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  # Use match to replace or comment out existing lines that enable password authentication
  match  => '^#?PasswordAuthentication yes|^#?PasswordAuthentication no',
}

# Ensure the custom identity file is set (required: use private key ~/.ssh/school)
file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  # Optionally use match to ensure no other IdentityFile lines are present, but for simplicity, we'll just insert
}
