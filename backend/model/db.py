from flask_sqlalchemy import SQLAlchemy

# SQLAlchemy 인스턴스 생성
db = SQLAlchemy()

# 모델 정의
class ClassDescription(db.Model):
    __tablename__ = 'class_descriptions'
    id = db.Column(db.Integer, primary_key=True)
    class_name = db.Column(db.String(255), unique=True, nullable=False)
    description = db.Column(db.Text, nullable=False)

# 데이터베이스 초기화 (테이블 생성은 건너뛰기)
def init_db(app):
    with app.app_context():
        #기존 데이터 삭제 (원하는 경우에만 사용)
        db.session.query(ClassDescription).delete()

        # 새 데이터 추가
        descriptions = [
            {"class_name": "Acne",
             "description": "Acne(여드름)은 피부에 나는 빨간색 고름입니다.\n"
            "스트레스는 풀면서 충분한 수면 등을 통해 신체 휴식을 적절히 취해주는 것이 좋습니다. "
            "수면 부족은 정상적인 성장 호르몬에 의한 피부 재생 기능을 제대로 이루어지지 못하게 하여 "
            "각질을 방치하고, 피부에 영양공급이 부실하게 되어 염증이 잘 생기게 합니다.\n"
            "추천 음식은 당근, 시금치, 통곡물"},
            {"class_name": "Atopic", 
            "description" : "아토피 피부염은 만성적인 염증성 피부 질환으로 가려움증과 피부 건조증을 동반합니다.\n"
            "스트레스, 온도 변화, 특정 알레르기 유발 물질이 아토피 증상을 악화시킬 수 있습니다.\n"
            "추천 음식 : 오메가3 지방산이 풍부한 연어, 고등어, 호두, 비타민D가 풍부한 연어, 계란"},
            {"class_name": "Psoriasis",
            "description": "건선은 피부 세포가 빠르게 성장하여 얇고 붉은 비늘 같은 피부 표면을 만듭니다.\n"
            "염증성 피부질환으로, 피부가 건조하고 각질이 생기며 가려움증을 동반할 수 있습니다.\n"
            "항염증 효과가 있는 올리브 오일, 강황, 블루베리 같은 음식을 섭취하는 것이 좋습니다."},
            {"class_name": "Rosacea",
             "description": "주사는 얼굴에 발적과 홍반이 나타나는 피부 질환으로, 주로 코, 볼, 이마에 발생합니다.\n"
            "온도 변화나 자극적인 음식, 음주 등이 증상을 악화시킬 수 있습니다.\n"
            "추천 음식 : 항염증 효과가 있는 녹차, 생강, 강황"},
            {"class_name": "SkinCancer",
             "description": "피부암은 피부의 비정상적인 세포 성장으로 인해 발생하는 암입니다.\n"
            "피부암의 주요 위험 요소는 자외선(UV) 노출입니다.\n"
            "항산화 성분이 풍부한 토마토, 브로콜리, 녹차와 같은 음식을 섭취하는 것이 예방에 도움이 됩니다."},
            {"class_name": "Urticaria",
             "description": "두드러기는 피부에 발진이 생기고 가려움증을 동반하는 질환입니다.\n"
            "알레르기 반응이나 스트레스, 특정 음식이나 약물에 의해 유발될 수 있습니다.\n"
            "비타민C가 풍부한 감귤류, 딸기, 오메가3가 포함된 연어, 고등어, 정어리 등의 음식을 섭취하는 것이 좋습니다."}
        ]

        # 새로운 데이터를 삽입
        for desc in descriptions:
            class_desc = ClassDescription(class_name=desc["class_name"], description=desc["description"])
            db.session.add(class_desc)

        # 커밋하여 변경사항 저장
        db.session.commit()

        print("Database initialized with new data!")
