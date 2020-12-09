# OBS Deploy tool

Simple tool to deploy OBS via zypper to our reference server

## Build Status
[![CircleCI](https://circleci.com/gh/vpereira/obs_deploy.svg?style=svg)](https://app.circleci.com/pipelines/github/vpereira/obs_deploy)

## Codebeat
[![codebeat badge](https://codebeat.co/badges/767d7e65-0364-4386-a26e-99ad228dfe31)](https://codebeat.co/projects/github-com-vpereira-obs_deploy-master)


## Installation

Just run:

```
gem install obs_deploy
```

or

```
zypper ar https://download.opensuse.org/repositories/home:/vpereirabr/openSUSE_Tumbleweed/home:vpereirabr.repo
zypper in  ruby2.6-rubygem-obs_deploy
```

## Usage



### To deploy

As default it will run in `dry-run` mode (no changes are made)

#### dry-run:

`obs_deploy deploy --user root --host localhost`

or 

`obs_deploy deploy --user root --host localhost --dry-run`

### deploy

`obs_deploy deploy --user root --host localhost --no-dry-run`



### To check which version is deployed

`obs_deploy deployed-version [--host <server>]`

### To check which package is available to install

`obs_deploy available-package [<product>] [<package-name>]`

### Refresh Zypper repositories

`obs_deploy refresh-repositories`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Fixtures

To generate the fixtures (located under `spec/fixtures`), we are using `curl -si $URL > $FIXTURE` 

### Run the `bin/obs_deploy` on development:

On the checked out source, run the following:

`ruby -Ilib bin/obs_deploy -v`

if you want to run it against the OBS appliance running on VirtualBox:

- Make sure that you can ssh without password into your VM
- Make sure the appliance is running in __bridge__ mode
- build the docker image as:
  
  ```
  docker build -t $USER/obs_deploy .
  ```

- then run the container as:

    ```
    make docker-dev
    ```
Now you are inside the container and should be able to ping the obs appliance.

From there:

```
$ obs_deploy refresh-repositories --host=$APPLIANCE_IP
```


## Hacking

If you want to add new command to the cli, please read the `dry-cli` documentation https://dry-rb.org/gems/dry-cli/0.4/. The commands are in the `obs_deploy/cli/commands` directory.

The commands are being sent via ssh and ssh is being called via `cheetah` https://github.com/openSUSE/cheetah. Please Read the `ssh.rb` file, specially the `SSH#run` method

## RPM Building

Under dist/ we have the necessary files to use to build the gem as rpm. The
`_service` still not used. Mainly because we need either to build the rubygem
dependencies or use https://github.com/openSUSE/obs-service-bundle_gems

Today as it is, you have to push the gem to rubygems and then generate the spec
and push it to build service

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vpereira/obs_deploy.
