class people::billweiss {
# says it doesn't conflict with macvim.  Lies.
#  include vim
#  include atom # busted, I don't know.  https://github.com/boxen/puppet-atom/issues/4

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
  }

  git::config::global { 'push.default':
    value => 'matching',
  }
}
