# 🚂 Deploy no Railway

Guia completo para fazer deploy da API no Railway via GitHub.

## 📋 Pré-requisitos

1. Conta no [Railway](https://railway.app)
2. Repositório no GitHub com o código
3. GitHub conectado à sua conta Railway

## 🚀 Passo a Passo

### 1. Preparar o Repositório no GitHub

Certifique-se de que todo o código está commitado e no GitHub:

```bash
git add .
git commit -m "Ajustes para deploy no Railway"
git push origin main
```

### 2. Criar Projeto no Railway

1. Acesse https://railway.app
2. Faça login com sua conta GitHub
3. Clique em **"New Project"**
4. Selecione **"Deploy from GitHub repo"**
5. Escolha o repositório `api-felipe`
6. O Railway detectará automaticamente o Dockerfile

### 3. Configuração Automática

O Railway irá:
- ✅ Detectar o `Dockerfile` na pasta `api/`
- ✅ Usar o `railway.json` ou `railway.toml` para configurações
- ✅ Definir automaticamente a variável `PORT`
- ✅ Fazer build e deploy automaticamente

### 4. Verificar Deploy

1. Após o deploy, o Railway gerará uma URL pública
2. Acesse a URL para testar:
   - `https://seu-projeto.up.railway.app/`
   - `https://seu-projeto.up.railway.app/status`
   - `https://seu-projeto.up.railway.app/alice`

### 5. Configurar Domínio Personalizado (Opcional)

1. No dashboard do Railway, vá em **Settings**
2. Clique em **"Generate Domain"** ou adicione um domínio customizado
3. Configure o DNS conforme as instruções

## 🔧 Variáveis de Ambiente

O Railway define automaticamente:
- `PORT` - Porta onde a aplicação deve rodar

Se precisar adicionar variáveis customizadas:
1. No dashboard do Railway, vá em **Variables**
2. Adicione as variáveis necessárias
3. O Railway fará redeploy automaticamente

## 📊 Monitoramento

O Railway oferece:
- **Logs em tempo real** - Veja os logs da aplicação
- **Métricas** - CPU, memória, rede
- **Deploys automáticos** - A cada push no GitHub

## 🔄 Atualizações Automáticas

Após conectar o GitHub:
- Cada push na branch `main` (ou a branch configurada) fará deploy automático
- Você pode desabilitar isso em **Settings → Source**

## 🐛 Troubleshooting

### Build falha

**Verificar logs:**
1. No dashboard do Railway, clique em **Deployments**
2. Veja os logs do build para identificar o erro

**Problemas comuns:**
- Dependências faltando no `requirements.txt`
- Erro no Dockerfile
- Caminho do Dockerfile incorreto

### Aplicação não responde

**Verificar:**
1. A aplicação está usando `0.0.0.0` como host? ✅ (já configurado)
2. A aplicação está usando a variável `PORT`? ✅ (já configurado)
3. Verifique os logs em tempo real no dashboard

### Porta incorreta

O Railway define `PORT` automaticamente. Se houver problemas:
1. Verifique se o Dockerfile está usando `${PORT:-8000}`
2. Verifique os logs para ver qual porta está sendo usada

## 💰 Plano Gratuito

O Railway oferece:
- $5 de crédito grátis por mês
- Deploy ilimitado
- Domínio `.railway.app` grátis
- SSL automático

## 📝 Comandos Úteis (Railway CLI)

Se quiser usar a CLI do Railway:

```bash
# Instalar Railway CLI
npm i -g @railway/cli

# Login
railway login

# Inicializar projeto
railway init

# Fazer deploy
railway up

# Ver logs
railway logs

# Ver variáveis
railway variables
```

## ✅ Checklist de Deploy

- [ ] Código commitado e no GitHub
- [ ] Dockerfile configurado corretamente
- [ ] `railway.json` ou `railway.toml` presente
- [ ] Repositório conectado no Railway
- [ ] Deploy concluído com sucesso
- [ ] URL pública funcionando
- [ ] Endpoints testados

## 🎉 Pronto!

Sua API está no ar! O Railway fará deploy automático a cada push no GitHub.
