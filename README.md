# Project Docker Microcredential
micro-credential VIB/UGent - Reproducible data analysis

In this project, you will train, run and serve a machine learning model using Docker. Furthermore, you will store the Docker images on your own account on Docker hub. Using the image of the training step, you will build an Apptainer image on the HPC of UGent.

## Deliverables

- [ ] Clone this repository to your personal github account
- [ ] Containerize training the machine learning model
- [ ] Containerize serving of the machine learning model
- [ ] Train and run the machine learning model using Docker
- [ ] Run the Docker container serving the machine learning model
- [ ] Store the Docker images on your personal account on Docker Hub
- [ ] Provide the resulting Dockerfiles in GitHub
- [ ] Build an Apptainer image on a HPC of your choice
- [ ] Provide the logs of the slurm job in GitHub
- [ ] Document the steps in a text document in GitHub
- [ ] Send a zip file of your gitrepository when you are done (that is what will be evaluated)

## Proposed steps - containerize and run training the machine learning model

Complete file named `Dockerfile.train`

- Copy requirements.txt and install dependencies
- Copy train.py to the working directory
- Set the command to run train.py
- Run the training of the model on your computer
- Document the command as comment in the Dockerfile
- Store the created Dockerfile in your cloned github repository

## Proposed steps - containerize and serve the machine learning model

- Correct the order of the instructions in the Dockerfile.infer
- Document the steps in the Dockerfile.infer as comments
- Document the succesful `docker run` command in the Dockerfile.infer as a comment

## Proposed steps - store images on Dockerhub and build an Apptainer image on the HPC

- Create an account on Dockerhub
- Store the built images on your account
- Create a shell script on the HPC of your preference
- Store the shell script in your cloned github repository

## Project delivery

- Send the zip file to the trainers

