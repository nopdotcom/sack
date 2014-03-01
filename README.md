# Sack

  Sack is a tool for searching and jumping into edit files

  Sack searches recursively in a directory using a priority queue of search tools.
    `ag > ack > grep`

  Sack outputs those shortcuts into `~/.sack_shortcuts` for easy editing.

## Installation

  `curl -L https://raw.github.com/zph/sack/master/install.sh | bash -s`

  It will install two files into `~/bin`. One is `sack` the search util and the other is the complimentary `F` which will allow you to instantly edit those files with Vim.

  Sack is unixy, just copy the bin into your $PATH
  To compile a new copy of it: `rake compile`

## Usage

  `sack tough-to-find-line-of-code`

## Compatibility

  We try to follow semver for this project.  Ie large breaking changes will, hopefully, only occur with major releases, ie 1.0.0 to 2.0.0.

  While the versions are < 1.0.0 there are no rules for this project and our only contract with users is that versions will increase consistently rather than going all cattywhompus (ie 0.0.1 -> 2.0.0 -> 1.5.5).  It'll always be onward & upward.


## Credit

  Original idea & implementation belong to @sampson-chen:
  https://github.com/sampson-chen/sack.
    
  Rewritten for cleanliness in Ruby b/c Shell scripts past a certain
  length are unweildy and tough to extend.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/sack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
