#!/bin/bash

TRAINPATH=/content/PubMedCLIP/data/ImageClef-2019-VQA-Med-Training # TRAINPATH=/path/to/ROCO/train
VALPATH=/content/PubMedCLIP/data/ImageClef-2019-VQA-Med-Validation # VALPATH=/path/to/ROCO/validation
TESTPATH=/content/PubMedCLIP/data/VQAMed2019Test # TESTPATH=/path/to/ROCO/test
JSONPATH=./data
CREATEJSONPROG=./main/create_jsons.py

chmod +x $CREATEJSONPROG

echo "Creating json files..."
$CREATEJSONPROG $TRAINPATH $VALPATH $TESTPATH $JSONPATH

#######***************************##########
CONFIGFILE=./configs/medclip_roco_all.yaml
MAINPROG=./main/main.py

chmod +x $MAINPROG

echo "Training CLIP with ROCO train dataset and ViT32 encoder..."
$MAINPROG --cfg $CONFIGFILE --gpu 0

#####################################
CONFIGFILE=./configs/medclip_roco_all_resnet50.yaml
MAINPROG=./main/main.py

chmod +x $MAINPROG

echo "Training CLIP with ROCO train dataset and resnet50 encoder..."
$MAINPROG --cfg $CONFIGFILE --gpu 0

#####################################
CONFIGFILE=./configs/medclip_roco_all_resnet50x4.yaml
MAINPROG=./main/main.py

chmod +x $MAINPROG

echo "Training CLIP with ROCO train dataset and resnet50x4 encoder..."
$MAINPROG --cfg $CONFIGFILE --gpu 0
