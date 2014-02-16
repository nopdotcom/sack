# Sack

  Sack is a tool for searching and jumping into edit files

  Sack searches recursively in a directory using a priority queue of search tools.
    `ag > ack > grep`

  Sack outputs those shortcuts into `~/.sack_shortcuts` for easy editing.

## Installation

  Sack is unixy, just copy the bin into your $PATH
  To compile a new copy of it: `rake compile`

## Usage

  `sack tough-to-find-line-of-code`


## Credit

  Original idea & implementation belong to @sampson-chen:
  https://github.com/sampson-chen/sack.
    
  Rewritten for cleanliness in Ruby b/c Shell scripts past a certain
  length are unweildy and tough to extend.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rsack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
