from flask_restful import reqparse, Resource
import requests
import numpy as np
import torch
import torchvision.transforms as transforms
import torchvision.models as models
from PIL import Image
from flask import request

class Test(Resource):
    def __init__(self):
        #Resnet 모델 로드
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.model = models.resnet50(pretrained=True)
        self.model.fc = torch.nn.Linear(self.model.fc.in_features, 5)

        self.state_dict = torch.load("./backend/model/ResNet50.pth", map_location=torch.device('cpu'))#로컬 컴퓨터가 cpu라서 cpu로 돌리게끔 매핑
        self.model.load_state_dict(self.state_dict['model_state_dict'])# 모델에 state_dict 적용

        #클래스 이름
        self.class_names = self.state_dict['class_names']
        self.transform = transforms.Compose([
            transforms.Resize((224, 224)),  # ResNet 입력 크기
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
        ])
    
    def post(self):
        #프론트엔드에서 보낸 이미지 파일을 받기
        image_file = request.files['image'] 

        try: #이미지 파일을 메모리에서 바로 열기
            image = Image.open(image_file.stream) #stream으로 이미지를 open
        except Exception as e:
            return {"error" : f"Failed to open image: {str(e)}"}, 400
        
        #예측 수행
        predict_image = self.transform(image).unsqueeze(0).to(self.device)
        with torch.no_grad():
            output = self.model(predict_image)
            _, predicted = torch.max(output, 1)
        predicted_class = self.class_names[predicted.item()]

        return {"label": predicted_class}, 200 #임의 사진을 가지고 예측한 class이름 반환