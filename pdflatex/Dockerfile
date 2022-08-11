FROM python:3.9-slim

#Dockerfile for latex

#install latex
RUN apt-get update && apt-get install -y \
    texlive texlive-lang-english texlive-lang-german \
    texlive-latex-base texlive-latex-recommended texlive-latex-extra \
    && \ 
    apt-get clean -y
