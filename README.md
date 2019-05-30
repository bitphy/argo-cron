# ArgoCron

*ArgoCron* is a simple pod that triggers Argo Workflows using Kubernetes CronJobs. 
Works as an alternative to set up a calendar system using argo-events.

## Benefits over Argo Events

* Simplier deploy and configuration
* Can not allow concurrent runs (using concurrencyPolicy from Kubernetes)
* Cleans up old Workflow pods before starting a new Worfklow

## Getting Started

ArgoCron simply clones a Git repository and executes an `argo submit --watch` of a given workflow in the Git repository.

Also, in order to avoid older containers in the cluster, it can clean up and delete older containers before the execution of the cluster

### Prerequisites

[Install Argo](https://github.com/argoproj/argo/blob/master/demo.md) in your kubernetes cluster

### Usage

 1. Create a git repository containing your workflows
 2. Download and configure [argo.cronjob.yaml](https://github.com/bitphy/argo-cron/blob/master/argo.cronjob.yaml)

    * Set the SSH Key secret
    * Set the known_hosts secret
    * Set the name of the workflow file

 3. You can generate the fingerprints for `known_hosts` with `ssh-keyscan`:
 ```
 ssh-keyscan github.com OR ssh-keyscan bitbucket.com
 ```
 3. Set the container ARGs as the name of the file containing the workflow

### Docker container ENV variables

* **NAMESPACE** [`default`]: sets the namespace where to run the workflow in.
* **OLDER** [`5d`]: deletes all the previous workflow runs previous to certain time
* **GIT_BRANCH** [`master`]: git branch to be checked out to find the workflow


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Erik Berdonces** - *Initial work* - [BitPhy](https://www.bitphy.com)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* BitPhy Team
* Argo





