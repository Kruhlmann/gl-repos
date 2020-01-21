require "gitlab"

module Fetcher

  def print()
    File.open(ENV["GITLAB_REPO_CACHE"], "r:UTF-8") do |file_handle|
      file_handle.each_line do |repo|
        if repo.length > 0
          STDOUT.write "#{repo.split(":")[0]}\n"
        end
      end
    end
  end

  def fetch()
    cache = ""
    Gitlab.endpoint = ENV["GITLAB_ENDPOINT"] 
    Gitlab.private_token = ENV["GITLAB_TOKEN"] 
    Gitlab.projects.auto_paginate do |project|
      cache="#{cache}\n#{project.name_with_namespace}:#{project.web_url}"
    end
    File.write(ENV["GITLAB_REPO_CACHE"], cache)
  end
end
