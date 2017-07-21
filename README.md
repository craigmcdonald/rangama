# README

## How it works

This simple anagram solver uses Redis as a persistence layer for the dictionary used to solve the anagrams. Aside from that it is just a very simple webapp, which makes use of Rails Turbolinks to do everything on a single page.

## Dependencies

* Redis
* Node / Yarn / Webpack

## Set-up

* Clone the repo
* `cd <dir> && bundle intall`
* Start Redis
* `foreman start`
* Visit `0.0.0.0:5000`

Note that you might need to look at the `rake webpacker` output if there are issues with running it on a fresh install.

