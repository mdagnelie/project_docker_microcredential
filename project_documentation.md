# git repository
I first forked the github repository `vib_tcp/project_docker_microcredential` to my own github page. \
I then clone the forked repo to my local repository on my computer.\

# Dockerfiles
I started the project by writing the correct Dockerfile for training the model, in the file "Dockerfile.train".\
In the recipe, I initiate the docker image from a lightweight python image, the same as in the "Dockerfile.server" file: `FROM python:3.9-slim`\
As thre trained model is saved in the path "/app/models/iris_model.pkl" in the mounted volume, I chose `WORKDIR /app` for the image.\
I copied and run the requirement.txt file with pip, by also assuring that no cache data is being stored when the Docker image is created, to prevent redundancies and get a smaller image.\
Lastly, I copied the train.py file and add the command to run the file with python.\
--> git add, commit and push to the remote repository

I did the same for the Dockerfile.server, which is the recipe to build a server running the trained model, by ro-ordering correctly the recipe file.\
--> git add, commit and push to the remote repository

# Create Docker image and run a container for the training of the model
On my terminal: 
- `docker build --tag ml-train:v0.1 -f Dockerfile.train .`

This command builds a docker image with the name "ml-train:v0.1" by looking in the current local repo as build context (where I cloned the github repo) using the file "Dockerfile.train" as recipe.\
Then to create a container actually running the python script "train.py": 
- `docker run -u 501:20 -v ./models:/app/models ml-train:v0.1`

This create a container to train the model as detailed in the "train.py" file, and mount the volume with the local folder "models" so that the output is also available locally and not just inside the container. 
output: "Model training complete and saved as iris_model.pkl"

# Create Docker image and run a containter that build a server to use the trained model
On my terminal:
- `docker build --tag ml-serve:v0.1 -f Dockerfile.infer .`

Once the image is created, run a container from it with:
- `docker run -u 501:20 -p 8080:8080 -v ./models:/app/models ml-serve:v0.1`

This line will bridge local path "user/project_docker_microcredential/models" in which the iris_model.pkl file has been uploaded from the training, with the models folder of the container.\
This allows the container to "see" the trained model stored locally when executing the code of server.py. \
It also connects local and container internal ports 8080 to create a server. By going to `http://localhost:8080" we then get the info "welcome to Docker Lab".

# Testing a prediction on my terminal while the server is running
input:\
curl -X POST http://localhost:8080/predict \
     -H "Content-Type: application/json" \
     -d '{"input": [5.1, 3.5, 1.4, 0.2]}'

output:\
{
  "Prediction": [
    "setosa"
  ]
}

# Docker hub
Both images `ml-train:v0.1`and `ml-serve:v0.1` were pushed to my dockerhub repo with the lines : 
- ` docker tag ml-train:v0.1 mdagnelie/ml-train:v0.1` and `docker push mdagnelie/ml-train:v0.1`  
- `docker tag ml-serve:v0.1 mdagnelie/ml-serve:v0.1` and `docker push  mdagnelie/ml-serve:v0.1`

# Apptainer on the HPC 
