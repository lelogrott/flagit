# Flagit
[![Gem Version](https://badge.fury.io/rb/flagit.svg)](https://badge.fury.io/rb/flagit)
[![Build Status](https://travis-ci.org/lelogrott/flagit.svg?branch=master)](https://travis-ci.org/lelogrott/flagit)

*Flag it. Flag your commit. Share your knowledge and progress, bit by bit.*

An easy way to share your progress right after that commit you are proud of and want everyone to see.

*flagit* gets the last commit in your current branch and repository and turns into a tweet with a custom message as suffix.

- The path to repository defaults to your current working directory '.'
- The current branch needs to exist remotely, since *flagit* adds the commit url to the tweet. It defaults to the master branch if the current only exists locally.

First usage of *flagit v1.0.0*
```shell
flagit "Happy to use flagit to announce my first gem, flagit! There's still a lot to do, but IT WORKS"
```
Result can be found at https://twitter.com/lelogrott/status/1110482323772858368

## Installation
    gem install flagit
    
## Configuration
Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to
[register your application with Twitter][register]. Once you've registered an
application, make sure to set the correct access level, otherwise you may see
the error:

[register]: https://apps.twitter.com/

    Read-only application cannot POST

Your new application will be assigned a consumer key/secret pair which you will be prompted when using *flagit* for the first time. After providing *flagit* with those keys you will be redirected to Twitter in order to get your authentication PIN.

## Example

![alt text](https://github.com/lelogrott/flagit/blob/master/example.gif)
Example made with [Glorious Demo](https://glorious.codes/demo) by Rafael Camargo ([github](https://github.com/rafaelcamargo) [twitter](https://twitter.com/rcamargo))
