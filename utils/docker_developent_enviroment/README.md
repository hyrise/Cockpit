# Using docker development environment 

I you are unfamiliar with docker I recommend following guide to get you on track. 

https://training.play-with-docker.com/dev-stage1/

## Install docker 

### Ubuntu 

https://docs.docker.com/engine/install/ubuntu/

### Mac 

https://docs.docker.com/docker-for-mac/install/

## Main Idea 

The idea is to mount our working directory and work inside the ubuntu system of the container. So we will git pull and commit from inside the container.

## Image


### Build images

#### Ubuntu intel
(To get the image just type the following command in your terminal:  

* `docker pull dubrawski/cockpit_minimal_intel_xeon:1.0`

#### Mac osx
Coming in the future.
For the moment you need to build it on the mac
 
### Build you own image 

1. navigate in the folder for the image you want to build (for example `cd cockpit/utils/docker_developer_enviroment`)
2. run `docker image build --tag docker_cockpit .`

After you build an image you can always use it to start an container. 

### Starting a container 

1. Clone the cockpit
2. Set up .env 
3. Start the container with: 
	```
	docker container run --mount type=bind,source=/path/to/cloned/Cockpit,destination=/cockpit --name cockpit_container  --interactive --tty -p 8000:8000 dubrawski/cockpit_minimal_intel_xeon:1.0 bash
	```
	*I would recommend using setting up an alias for this command.*
	 
	* `--interactive` means you are starting an interactive shell. When you are closing this shell you are closing the container. You could also use `--detach` instead than the container would run in the background. Then you need to call `docker stop cockpit_container` at the end. 
	* `-p 8000:8000` is mapping the port number of the frontend. 

4. You should now be in the container. Now you need to navigate to the Cockpit with `cd cockpit`.
5. Crate a Pipenv shell with `pipenv shell`
6. Install all packages `pipenv sync --dev`

If you don't want to do step 6 every time you are starting a container you can mount the packages as well with: 

`--mount type=bind,source=path/to/your/mount/folder/Pipenv_packages,destination=/.local/share/virtualenvs/`

You can open a sub shell via: 
`docker exec -it cockpit_container` 

You can use git inside the container and you text editor on the mounted volume (/path/to/cloned/Cockpit)
If you want to use your git conficts from your local machine: 

https://stackoverflow.com/questions/52819584/copying-local-git-config-into-docker-container

## Boot Tool

Inside the container you can use the boot tool in: 
`cockpit/utils/docker_developent_enviroment`   

The basic usage is: 

```
    python boot_tool.py
```

It will start the backend components. 


