# Use python3.9 base image to ensure wsgi working
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

#ENV TZ=Europe/Berlin
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#install nginx and wand
RUN apt-get update && apt-get install -y \
    libmagickwand-dev \
    python3-pip 


# install latex
RUN apt-get update && apt-get install -y \
    texlive texlive-lang-english texlive-lang-german \
    texlive-latex-base texlive-latex-recommended texlive-latex-extra \
    && \ 
    apt-get clean -y
# or alternatively
# RUN apt-get update && apt-get install -y \
#     texlive-full && \ 
#     apt-get clean -y

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Add Image-magick policy file in order to allow working pdfs
COPY ./image-magick-policy.xml /etc/ImageMagick-6/policy.xml

# Make port 5432 available to the world outside this container
EXPOSE 5432

# Run app.py when the container launches
CMD ["python3","schilder.py"]
