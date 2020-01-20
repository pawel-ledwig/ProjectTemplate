# ProjectTemplate
Project template with newest version of Vue and Symfony, Docker-based, with CI for GitLab

## How to use

Run command:
```shell script
docker run -it --rm -v /ABSOLUTE/PATH/TO/DEST:/dest shooktea/project-template GITLAB_REGISTRY_ADDRESS
```

* `/ABSOLUTE/PATH/TO/DEST` is an absolute path to a directory that will contain whole project.
* `GITLAB_REGISTRY_ADDRESS` is address to main project registry that will contain both pushed application and php-dev image.

For example, if you want to generate project in directory `/home/nkowalik/projects/my-project` and you want to push
your application to `registry.gitlab.com/nkowalik/my-project` registry image, then use command like this:

```shell script
docker run -it --rm -v /home/nkowalik/projects/my-project:/dest shooktea/project-template registry.gitlab.com/nkowalik/my-project
```

## After generation

1. Enter generated directory
1. Initialize git repository and add remote directory. If you add this to correct GitLab repository, pipelines will work.
1. Run `docker-compose up -d --build` to set up project on local environment
1. Run following commands to set up frontend:
    ```shell script
    docker-compose run npm npm ci
    docker-compose run npm npm run build
    ```
1. Run `docker-compose exec `