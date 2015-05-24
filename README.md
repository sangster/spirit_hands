Spirit Fingers
============

This repo is a fork, with updates and bug fixes based on [`spirit_hands`](https://github.com/nixme/spirit_hands).

Spending hours in the rails console? Spruce it up and show off those
hard-working hands!

**spirit_fingers** is an opinionated set of console-related gems and a bit of glue:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Awesome Print**][awesome_print] for stylish pretty print.
* [**Hirb**][hirb] for tabular collection output.
* [**Hirb Unicode**][hirb-unicode-steakknife] for aligned Unicode output1.
* [**Pry Rails**][pry-rails] for additional commands (`show-routes`,
  `show-models`, `show-middleware`) in the Rails console.
* [**Pry Doc**][pry-doc] to browse Ruby source, including C, directly from the
  console.
* [**Pry Git**][pry-git] to teach the console about git. Diffs, blames, and
  commits on methods and classes, not just files.
* [**Pry Remote**][pry-remote] to connect remotely to a Pry console.
* [**Pry Coolline**][pry-coolline] for syntax highlighting as you type.


## Usage

Ruby 2.0.0+, Rails 3 or 4 only. Add to your project Gemfile:

```ruby
group :development, :test do
  gem 'spirit_fingers'
end
```

That's it. Run `rails console` as usual.

* [**Hirb**)](hirb) isn't enabled by default. To use, run `Hirb.enable` in the console. (or `SpiritFingers.hirb = true # or false to disable`)


Ruby compiled against a proper readline library, ideally GNU readline, is
recommended. Alternatively, [`gem install rb-readline`][rb-readline] for an
acceptible backup. Using ruby compiled against a `libedit` wrapper (primarily OS
X) will work but is not recommended.


## Options

Change the following options by creating a .pryrc  in your Rails or Ruby project

### Example `.pryrc`

```ruby
if defined?(SpiritFingers)
  SpiritFingers.colored_prompt = false
  SpiritFingers.hirb = true
end
```

### `awesome_print`

[**AwesomePrint**][awesome_print] is enabled by default.
`SpiritFingers.awesome_print = false` to disable.

### `color`

An alias for getting or setting `Pry.color`

### `colored_prompt`

Color the console prompt? Defaults to `true` when the current ruby is compiled
against GNU readline or `rb-readline`, which don't have issues counting
characters in colored prompts. `false` for libedit.

**Note:** `Pry.color = false` trumps this setting and disables all console coloring.

### `hirb`
[**Hirb**][hirb] is **disabled** by default.
`SpiritFingers.hirb = true` to enable.

### `hirb_unicode`
[**Hirb-unicode**][hirb-unicode] is enabled by default when hirb is enabled.
`SpiritFingers.hirb_unicode = false` to disable.  
No effect when hirb is disabled.


### `prompt`

#### Pseudo-XML-like Syntax as follows

```
   current command number <cmd/>
   app name               <app/>

   literal less-than <    \<     ( "\\<" in Ruby strings )
   bold                   <bold>....<bold>

   Foreground color:

   black                 <black>...</black>
   and red green yellow blue magenta cyan white

   Background color:

   bgblack bgred bggreen bgyellow bgblue bgmagenta bgcyan bgwhite

   Even the frightening blink tag, where available <blink>...</blink>

More at: SpiritFingers::Prompt::Render::MATCHED_TAG_CODES.keys

```

### `prompt_separator`

Separator string between the application name and line input. Defaults to `»`
for GNU readline or libedit. Defaults to `>` for `rb-readline` which fails on
mixed encodings.


[pry]:                      http://pry.github.com
[awesome_print]:            https://github.com/michaeldv/awesome_print
[hirb]:                     https://github.com/cldwalker/hirb
[hirb-unicode-steakknife]:  https://github.com/steakknife/hirb-unicode
[pry-rails]:                https://github.com/rweng/pry-rails
[pry-doc]:                  https://github.com/pry/pry-doc
[pry-git]:                  https://github.com/pry/pry-git
[pry-remote]:               https://github.com/Mon-Ouie/pry-remote
[pry-coolline]:             https://github.com/pry/pry-coolline
[coderay]:                  https://github.com/rubychan/coderay
[rb-readline]:              https://github.com/luislavena/rb-readline
[pullrequests]:             https://github.com/plribeiro3000/spirit_fingers/pulls
[issues]:                   https://github.com/plribeiro3000/spirit_fingers/issues
[changelog]:                https://github.com/plribeiro3000/spirit_fingers/blob/master/CHANGELOG.md
