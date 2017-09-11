# Contributing to Autobahn

👍🎉 First off, thanks for taking the time to contribute! 🎉👍

### Feature Requests

Go ahead and open an issue describing the feature you would like to see added to Autobahn. There we can discuss how we could go about adding that feature.

### Development

To get started developing Autobahn follow the these steps

```sh
$ git clone https://github.com/kdawgwilk/Autobahn.git
$ cd Autobahn
$ swift build

# You can run the cli from the build dir like this:
# .build/debug/autobahn drive <highway_name>
$ .build/debug/autobahn drive build

# Or I find it helpful to symlink to `/usr/local/bin` so I can run it directly
$ ln -s `pwd`/.build/debug/autobahn /usr/local/bin/autobahn

# autobahn drive <highway_name>
$ autobahn drive build
```