{
    "id": "df90a804-ce0e-4a36-b6e8-b19ffecf1613",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "_SpaceObject",
    "eventList": [
        
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.25,
    "physicsGroup": 1,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": true,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 0,
    "physicsShapePoints": [
        {
            "id": "f908205a-44fb-4210-bc46-3033929150c5",
            "modelName": "GMPoint",
            "mvc": "1.0",
            "x": 32,
            "y": 32
        },
        {
            "id": "5b9f5311-0320-4e58-bbe2-51654c9e893b",
            "modelName": "GMPoint",
            "mvc": "1.0",
            "x": 32,
            "y": 32
        }
    ],
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "7934a658-5f26-4d50-9ad6-17e9eec5ab88",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "collision_Damage",
            "varType": 0
        },
        {
            "id": "65af29dc-7ccb-471b-8e1a-5f41e17dab54",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "animation_Current_Set",
            "varType": 1
        },
        {
            "id": "21b05d82-2bc3-467b-9196-36f1d11c2e83",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": [
                "\"IDLE\"",
                "\"MOVE\"",
                "\"ATTACK\"",
                "\"TAKE_DAMAGE\"",
                "\"DIE\""
            ],
            "multiselect": true,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "\"IDLE\", \"MOVE\", \"ATTACK\", \"TAKE_DAMAGE\", \"DIE\"",
            "varName": "animation_Set_Array",
            "varType": 6
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": false
}