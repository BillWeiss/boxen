class people::billweiss {
  # local modifications
  include spotify
  include chrome
  include macvim
# says it doesn't conflict with macvim.  Lies.
#  include vim
  include iterm2::dev
#  include atom # busted, I don't know.  https://github.com/boxen/puppet-atom/issues/4
  include quicksilver
  include tunnelblick::beta
  include firefox
  include steam
  include python

  package {
    [
      'evernote',
    ]:
    provider => 'brewcask',
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
