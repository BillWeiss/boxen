class people::billweiss {
# says it doesn't conflict with macvim.  Lies.
#  include vim
#  include atom # busted, I don't know.  https://github.com/boxen/puppet-atom/issues/4

  class {
    [
      'chrome',
      'firefox',
      'iterm2::dev',
      'macvim',
      'python',
      'quicksilver',
      'spotify',
      'steam',
      'tunnelblick::beta',
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
