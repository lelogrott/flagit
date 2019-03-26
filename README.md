# Flagit
[![Gem Version](https://badge.fury.io/rb/flagit.svg)](https://badge.fury.io/rb/flagit)
[![Build Status](https://travis-ci.org/lelogrott/flagit.svg?branch=master)](https://travis-ci.org/lelogrott/flagit)

*Flag it. Flag your commit. Share your knowledge and progress, bit by bit.*

An easy way to share your your progress right after that commit you are proud of and want everyone to see.

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
