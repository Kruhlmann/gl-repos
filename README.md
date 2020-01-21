# gl-repos

Lists GitLab repos for piping into programs such as dmenu

## gl-repos-cache

Caches all available GitLab repositories in a local file.

### Environment

* `GITLAB_TOKEN` GitLab access token
* `GITLAB_ENDPOINT` GitLab API URL
* `GITLAB_REPO_CACHE` File to store cache in


## gl-repos-list

Lists all repos from the cache. Useful for programs such as dmenu.

### Environment

* `GITLAB_REPO_CACHE` File to read cache from.

(`GITLAB_ENDPOINT` and `GITLAB_TOKEN` are required if no cache exists).

## Example

```sh
# gl.sh
$BROWSER `grep -i "$(gl-repos-list | dmenu -i -l 10)" ~/.repo-cache | awk '{sub(/.*:/,"")}1' | awk '{ print "https:" $1 }'`
```

Presents a list of readable repositories and opens the chosen one in the default browser.
