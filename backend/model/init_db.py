import json

import os

from typing import Annotated

from fastapi import Depends

from sqlalchemy.orm import Session

from core.config import settings

from model.database import engine, get_db, Base

from model.disease import crud as disease_crud
from model.disease import schemas as disease_schemas

TEST_ID = 'test'
TEST_PASSWORD = '12341234'
TEST_PHONE = '01012341235'
TEST_RESIDENT_NUMBER = '1234567'

PATH = os.path.abspath(os.pardir)


def init_database(engine: engine, db: Annotated[Session, Depends(get_db)]):
    # Create Tables
    Base.metadata.create_all(bind=engine)

    disease_check = disease_crud.check_diseases_empty(db)
    if disease_check:
        ds1 = disease_schemas.DiseaseCreate(
            label='AKIEC',
            description=json.dumps([
                '앤티닉 케라토시스: 자외선 노출로 인해 발생하는 거칠고 비늘 모양의 피부 병변으로, 피부암으로 발전할 수 있는 전암성 상태입니다.',
                '보웬병: 표피에서 시작되는 상피내암으로, 완전히 치료하지 않으면 피부암으로 발전할 수 있습니다.',
                '원인: 장기간의 자외선 노출이 주요 원인입니다.',
                '예방법: 자외선 차단제를 꾸준히 사용하고, 외출 시 모자나 긴팔 옷을 착용해 피부를 보호하세요.'
            ]),
            title='앤티닉 케라토시스와 상피내암/보웬병 (AKIEC)',
        )
        ds2 = disease_schemas.DiseaseCreate(
            label='BCC',
            description=json.dumps([
                '피부암 중 가장 흔한 유형으로, 일반적으로 노출된 피부 영역에 발생하며, 성장이 느리고 주변 조직으로 퍼지는 것이 드뭅니다.',
                '원인: 주로 자외선에 의해 발생하며, 특히 과거에 심한 화상을 입었던 경우 발병 위험이 증가합니다.',
                '예방법: 과도한 햇빛 노출을 피하고, 정기적으로 피부 검사를 받아 이상 징후를 조기에 발견하세요.'
            ]),
            title='기저세포암종 (BCC)',
        )
        ds3 = disease_schemas.DiseaseCreate(
            label='BKL',
            description=json.dumps([
                '태양 각화증, 사마귀, 납작 사마귀 등이 포함되며, 주로 나이가 들면서 피부에 나타나는 양성 병변입니다.',
                '원인: 노화, 자외선 노출, 유전적 요인 등이 복합적으로 작용합니다.',
                '예방법: 자외선 차단과 피부 건강에 좋은 식습관을 유지하며 정기적인 피부 검진을 받는 것이 좋습니다.'
            ]),
            title='양성 각화증성 병변 (BKL)',
        )
        ds4 = disease_schemas.DiseaseCreate(
            label='DF',
            description=json.dumps([
                '피부에 발생하는 양성 결절로, 대개 통증이 없으며 색깔이 변할 수 있습니다.',
                '원인: 정확한 원인은 알려지지 않았으나, 외상 후 발생할 수 있습니다.',
                '예방법: 피부를 깨끗이 유지하고, 상처가 나면 적절히 치료하여 감염을 방지하세요.',
            ]),
            title='피부섬유종 (DF)',
        )
        ds5 = disease_schemas.DiseaseCreate(
            label='MEL',
            description=json.dumps([
                '가장 심각한 형태의 피부암으로, 치명적일 수 있으며, 피부의 멜라닌 세포에서 발생합니다. 초기 발견과 치료가 중요합니다.',
                '원인: 강한 자외선 노출이 주요 원인이며, 유전적 요인도 영향을 미칠 수 있습니다.',
                '예방법: 자외선 차단제 사용, 태닝 및 인공 자외선 노출을 피하고, 피부의 변화를 주의 깊게 관찰하세요.'
            ]),
            title='흑색종 (MEL)',
        )
        ds6 = disease_schemas.DiseaseCreate(
            label='NV',
            description=json.dumps([
                '일반적으로 양성인 모반으로, 멜라닌을 생성하는 세포에 의해 형성됩니다. 대부분의 경우 치료가 필요 없지만, 변화를 보일 때는 검사가 필요합니다.',
                '원인: 대부분 선천적으로 가지고 태어나거나, 생후 몇 년 내에 나타나며, 자외선 노출이 일부 영향을 미칠 수 있습니다.',
                '예방법: 특별한 예방법은 없으나, 모반의 변화를 주기적으로 관찰하고 이상이 있을 경우 전문의와 상담하세요.',
            ]),
            title='멜라닌성 모반 (NV)',
        )
        ds7 = disease_schemas.DiseaseCreate(
            label='VASC',
            description=json.dumps([
                '혈관종, 혈관각화종, 농양종, 출혈 등이 포함되며, 피부의 혈관과 관련된 병변입니다.',
                '원인: 선천적인 경우가 많으며, 외상이나 특정 질환의 결과로 발생할 수도 있습니다.',
                '예방법: 혈관 병변에 대한 특별한 예방법은 없으나, 발생한 경우 적절한 치료를 받아야 합니다.',
            ]),
            title='혈관 병변 (VASC)',
        )
        disease_crud.create_disease(db, ds1)
        disease_crud.create_disease(db, ds2)
        disease_crud.create_disease(db, ds3)
        disease_crud.create_disease(db, ds4)
        disease_crud.create_disease(db, ds5)
        disease_crud.create_disease(db, ds6)
        disease_crud.create_disease(db, ds7)