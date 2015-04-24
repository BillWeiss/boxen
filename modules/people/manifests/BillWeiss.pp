class people::billweiss {
# says it doesn't conflict with macvim.  Lies.
#  include vim
#  include atom # busted, I don't know.  https://github.com/boxen/puppet-atom/issues/4

  $homedir = "/Users/${boxen_user}"

  class {
    [
      'adium',
      'chrome',
      'cord',
      'csshx',
      'firefox',
      'flux',
      'googledrive',
      'iterm2::dev',
      'jq',
      'macvim',
      'nmap',
      'ohmyzsh',
      'python',
      'quicksilver',
      'screen',
      'spotify',
      'steam',
      'tmux',
      'transmission',
      'tunnelblick::beta',
      'vlc',
      'vmware_fusion',
      'wget',
      'zsh',
    ]:
  }

  package {
    [
      'evernote',
    ]:
    provider => 'brewcask',
  }

  package {
    [
      'ssh-copy-id',
      'the_silver_searcher',
    ]:
  }

  git::config::global { 'user.email':
      value => 'bweiss@backstopsolutions.com';
    'user.name':
      value => 'Bill Weiss';
    'push.default':
      value => 'matching';
  }

  $repodir = "${homedir}/repos"

  file { $repodir:
    ensure => directory,
    owner  => $boxen_user,
    mode   => 0700,
  }

  repository {
    "${repodir}/puppet-BillWeiss":
      source   => 'BillWeiss/Puppet',
      provider => 'git';
    "${repodir}/dotfiles":
      source   => 'BillWeiss/dotfiles',
      provider => 'git';
  }
}
