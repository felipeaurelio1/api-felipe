from fastapi import FastAPI

app = FastAPI() # Nome da Aplicação

@app.get("/")
def root():
    return "Hello World"

@app.get("/alice")
def alice():
    return "Alice Saúde"

@app.get("/about")
def about():
    return "Sobre a aplicação"

@app.get("/status")
def status():
    return "200 - API Funcionando"

@app.get("/isabela")
def status():
    return "amor da minha vida"