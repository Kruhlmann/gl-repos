# gl-repos

[![Gem](https://img.shields.io/gem/v/gl-repos?style=for-the-badge)](https://rubygems.org/gems/gl-repos)
[![Build status](https://img.shields.io/github/workflow/status/kruhlmann/gl-repos/gempush/publish?style=for-the-badge)](https://github.com/Kruhlmann/gl-repos/actions)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/Kruhlmann/gl-repos?style=for-the-badge)](https://codeclimate.com/github/Kruhlmann/gl-repos/maintainability)

Lists GitLab repos for piping into programs such as dmenu

## gl-repos-cache

Caches all available GitLab repositories in a local file.

### Usage

`gl-repos-cache`

### Environment

* `GITLAB_TOKEN` GitLab access token
* `GITLAB_ENDPOINT` GitLab API URL
* `GITLAB_REPO_CACHE` File to store cache in


## gl-repos-list

Lists all repos from the cache. Useful for programs such as dmenu.

### Usage

`gl-repos-cache`

### Environment

* `GITLAB_REPO_CACHE` File to read cache from.

## Example

```sh
# gl.sh
$BROWSER `grep -i "$(gl-repos-list | dmenu -i -l 10)" $GITLAB_REPO_CACHE | awk '{sub(/.*:/,"")}1' | awk '{ print "https:" $1 }'`
```

Presents a list of readable repositories and opens the chosen one in the default browser.
