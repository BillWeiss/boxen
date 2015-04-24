class people::billweiss {
# says it doesn't conflict with macvim.  Lies.
#  include vim
#  include atom # busted, I don't know.  https://github.com/boxen/puppet-atom/issues/4

  class {
    [
      'spotify',
      'chrome',
      'macvim',
      'iterm2::dev',
      'quicksilver',
      'tunnelblick::beta',
      'firefox',
      'steam',
      'python',
    ]:
  }


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
