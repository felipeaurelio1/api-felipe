# 🚀 Como Subir o Código para o GitHub

## Passo a Passo

### 1. Criar o Repositório no GitHub

1. Acesse https://github.com
2. Clique no botão **"+"** no canto superior direito
3. Selecione **"New repository"**
4. Preencha:
   - **Repository name**: `api-felipe` (ou o nome que preferir)
   - **Description**: "API FastAPI com Docker"
   - **Visibility**: Escolha **Public** ou **Private**
   - **NÃO marque** "Initialize this repository with a README" (já temos um)
5. Clique em **"Create repository"**

### 2. Conectar o Repositório Local ao GitHub

Após criar o repositório, o GitHub mostrará instruções. Execute os comandos abaixo:

**Se você ainda não conectou o repositório remoto:**

```bash
cd "/Users/felipe/Documents/Repos/api-felipe"

# Adicionar o repositório remoto (substitua SEU_USUARIO pelo seu username do GitHub)
git remote add origin https://github.com/SEU_USUARIO/api-felipe.git

# Ou se preferir usar SSH (recomendado):
git remote add origin git@github.com:SEU_USUARIO/api-felipe.git
```

**Verificar se foi adicionado corretamente:**
```bash
git remote -v
```

### 3. Fazer Push para o GitHub

```bash
# Enviar o código para o GitHub
git push -u origin main
```

**Nota**: Na primeira vez, o GitHub pode pedir suas credenciais:
- Se usar HTTPS: username e Personal Access Token (não use senha)
- Se usar SSH: certifique-se de ter configurado suas chaves SSH

### 4. Verificar no GitHub

Acesse seu repositório no GitHub e verifique se todos os arquivos foram enviados corretamente.

## 🔐 Configuração de Autenticação

### Opção 1: Personal Access Token (HTTPS)

1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Selecione as permissões: `repo`
4. Copie o token gerado
5. Use o token como senha quando o Git pedir

### Opção 2: SSH (Recomendado)

**Verificar se já tem chave SSH:**
```bash
ls -al ~/.ssh
```

**Se não tiver, criar uma:**
```bash
ssh-keygen -t ed25519 -C "seu-email@example.com"
```

**Copiar a chave pública:**
```bash
cat ~/.ssh/id_ed25519.pub
```

**Adicionar no GitHub:**
1. GitHub → Settings → SSH and GPG keys
2. New SSH key
3. Cole a chave pública
4. Salve

## 📝 Comandos Úteis para o Futuro

```bash
# Ver status das mudanças
git status

# Adicionar arquivos modificados
git add .

# Fazer commit
git commit -m "Descrição das mudanças"

# Enviar para o GitHub
git push

# Ver histórico de commits
git log --oneline

# Ver diferenças
git diff
```

## 🔄 Atualizar o Repositório

Sempre que fizer mudanças no código:

```bash
git add .
git commit -m "Descrição das mudanças"
git push
```

## 🐛 Problemas Comuns

### Erro: "remote origin already exists"
```bash
# Remover o remote existente
git remote remove origin

# Adicionar novamente com a URL correta
git remote add origin https://github.com/SEU_USUARIO/api-felipe.git
```

### Erro de autenticação
- Verifique se está usando Personal Access Token (não senha)
- Ou configure SSH corretamente

### Erro: "failed to push some refs"
```bash
# Fazer pull primeiro (se houver mudanças no GitHub)
git pull origin main --rebase

# Depois fazer push
git push
```
