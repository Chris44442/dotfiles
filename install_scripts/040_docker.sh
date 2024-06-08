#!/bin/bash

sudo systemctl enable docker.service
sudo usermod -aG docker chris

