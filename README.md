Generate MkDocs documentation
=============

Docker container to generate nice documentation using [MkDocs](http://www.mkdocs.org/) - a project documentation with Markdown.

##Variables

| KEY  | value  | optional | description |
| :------------ |:---------------:| -----:| -----:|
| DEBUG      | 0/1 | yes | debug mode/log enabled (default is not) |
| COMMIT_NAME      | jenkins        | yes | the name of the committer (default is jenkins) |
| COMMIT_EMAIL | jenkins@sequenceiq.com        |    yes | the mail of the committer (default is jenkins) |
| KEY | rsa-key        |    no | the rsa key for the authentication |
| PROJECT | cloudbreak        |    yes | the project name on GitHub (default is cloudbreak)|
