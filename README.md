# Releasing OR-tools code to Maven Central

## Preparing the environment

The release process needs some personal information for signing JARs and connecting to Sonatype.
These pieces of information are provided to the `env_file` environment file. A template id provided in file `template_env_file`

Below is a description of the variables to be provided:
| -------------- | -------------------------------------- |
| SONATYPE_USER  | Sonatype username                      |
| SONATYPE_PASS  | Sonatype associated password           |
| GPG_ID         | GPG key ID to be used for signing JARs |
| GPG_PASSPHRASE | Passphrase of the GPG key              |
| -------------- | -------------------------------------- |

You can find your GPG key with following command:

```
gpg2 --list-keys
```

The release process also need to import your GPG key in the created container. For that export the associated GPG key to a file named `private.key` in release directory.

```
gpg --export-secret-keys <GPG_ID> > private.key
```

## Releasing OR-tools

First, build docker image:

```
docker build -t or-tools-release .
```

Finnaly, run the generated image attaching the environment file filled previously:

```
docker run --env-file=env_file or-tools-release
```

## Known limitations

Releasing the package behind proxy is not currently handled.
