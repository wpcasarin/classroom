from fastapi import FastAPI
import json

app = FastAPI()
data = json.load(open('./data.json', 'r'))


@app.get('/api')
async def root():
    return data
