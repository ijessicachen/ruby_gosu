# Ruby with game library Gosu

You'll notice this directory ordered into chapters, as this is my working space for the contents within the book *Learn Game Programming with Ruby* by Mark Sobkowicz.
- btw the book is free [here](https://gameswithcode.com/games-with-code/)

**important information**
Apple's built-in Ruby has issues so install with Homebrew
- more information here: https://github.com/gosu/gosu/wiki/Getting-Started-on-OS-X
- make sure to also follow the instructions about having ruby first in your PATH
```
By default, binaries installed by gem will be placed into:
  /opt/homebrew/lib/ruby/gems/3.4.0/bin

You may want to add this to your PATH.

ruby is keg-only, which means it was not symlinked into /opt/homebrew,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have ruby first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc

For compilers to find ruby you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
```

## Helpful resources

ruby: https://www.ruby-lang.org/en/
more on gosu: https://www.libgosu.org/
