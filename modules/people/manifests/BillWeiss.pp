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

  osx::recovery_message { 'If you find this Mac, please call 312-277-7750': }
  class { [
    'osx::global::disable_key_press_and_hold',
    'osx::global::enable_keyboard_control_access',
    'osx::global::expand_print_dialog',
    'osx::global::expand_save_dialog',
    'osx::global::disable_remote_control_ir_receiver',
    'osx::global::natural_mouse_scrolling',
    'osx::dock::clear_dock',
    'osx::dock::disable_dashboard',
    'osx::dock::dim_hidden_apps',
    'osx::finder::unhide_library',
    'osx::universal_access::ctrl_mod_zoom',
    'osx::software_update',
    'osx::keyboard::capslock_to_control',
    ]:
  }

  class { 'osx::dock::icon_size':
    size => 24,
  }

  class { 'osx::dock::magnification':
   magnification_size => 64,
  }

  class { 'osx::dock::position':
    position => 'bottom',
  }

  class { 'osx::dock::pin_position':
    position => 'middle',
  }

  osx::dock::hot_corner { 'Bottom Left':
    action => 'Start Screen Saver',
  }
}
