## Criando um Projeto Django REST Framework Completo

Este guia detalhado irá te guiar passo a passo na criação de um projeto Django REST Framework completo, desde a instalação do ambiente até a implementação de um endpoint funcional com validações.

  **1. Preparando o Ambiente**
  
  Comece instalando as dependências básicas:
  
  ```bash
  sudo apt-get install python3.12-venv python3.12-dev python3.12-distutils python3-pip
  ```
  
  Crie um ambiente virtual para isolar o projeto:
  
  ```bash
  python3 -m venv venv
  ```
  
  Ative o ambiente virtual:
  
  ```bash
  source venv/bin/activate
  ```
  
  Instale as dependências do projeto:
  
  ```bash
  pip install -r requirements.txt
  ```
  
  Instale o Django REST Framework:
  
  ```bash
  pip install djangorestframework
  ```
  
  Crie um arquivo `requirements.txt` para registrar as dependências instaladas:
  
  ```bash
  pip freeze > requirements.txt
  ```
  
  **2. Iniciando o Projeto Django REST**
  
  Crie um projeto Django:
  
  ```bash
  django-admin startproject setup .
  ```
  
  **3. Configuração Básica no settings.py**
  
  No arquivo `settings.py`, adicione o `rest_framework` à lista `INSTALLED_APPS`:
  
  ```python
  INSTALLED_APPS = [
      ...
      'rest_framework',
  ]
  ```
  
  Configure o idioma e fuso horário:
  
  ```python
  LANGUAGE_CODE = 'pt-br'
  TIME_ZONE = 'America/Manaus'
  ```
  
  **4. Executando o Servidor**
  
  Execute o servidor de desenvolvimento:
  
  ```bash
  python manage.py runserver
  ```
  
  Acesse `http://localhost:8000/` em seu navegador para verificar se o servidor está funcionando.
  
  **5. Migrando as Tabelas do Django**
  
  Migre as tabelas padrão do Django para o banco de dados:
  
  ```bash
  python manage.py migrate
  ```
  
  **6. Criando um App**
  
  Crie um app para gerenciar seus dados:
  
  ```bash
  python manage.py startapp clientes
  ```
  
  Adicione o app `clientes` à lista `INSTALLED_APPS` em `settings.py`:
  
  ```python
  INSTALLED_APPS = [
      ...
      'clientes.apps.ClientesConfig',
  ]
  ```
  
  **7. Explorando os Arquivos do App**
  
  Um app Django geralmente contém os seguintes arquivos:
  
  * **models.py:** Define os modelos de dados.
  * **admin.py:** Registra os modelos no painel de administração do Django.
  * **serializers.py:** Define os serializadores para converter dados entre Python e JSON.
  * **views.py:** Contém as classes de visualização que manipulam os dados.
  * **tests.py:** Contém testes unitários para o código do app.
  
  **8. Criando um Superusuário**
  
  Crie um superusuário para acessar o painel de administração:
  
  ```bash
  python manage.py createsuperuser
  ```
  
  **9. Desenvolvendo o App Clientes**
  
  **9.1 Configurando o Model**
  
  No arquivo `models.py`, defina o modelo `Cliente`:
  
  ```python
  from django.db import models
  
  class Cliente(models.Model):
      nome = models.CharField(max_length=255)
      email = models.EmailField()
      # Outros campos...
  ```
  
  **9.2 Configurando o admin.py**
  
  No arquivo `admin.py`, registre o modelo `Cliente` no painel de administração:
  
  ```python
  from django.contrib import admin
  from .models import Cliente
  
  admin.site.register(Cliente)
  ```
  
  **9.3 Criando o Serializer.py**
  
  No arquivo `serializers.py`, defina o serializer para o modelo `Cliente`:
  
  ```python
  from rest_framework import serializers
  from .models import Cliente
  
  class ClienteSerializer(serializers.ModelSerializer):
      class Meta:
          model = Cliente
          fields = '__all__'
  ```
  
  **9.4 Configurando a view.py**
  
  No arquivo `views.py`, defina as classes de visualização para gerenciar os dados do cliente:
  
  ```python
  from django.shortcuts import get_object_or_404
  from .models import Cliente
  from .serializers import ClienteSerializer
  from rest_framework import viewsets
  
  class ClienteViewSet(viewsets.ModelViewSet):
      queryset = Cliente.objects.all()
      serializer_class = ClienteSerializer
  
      def retrieve(self, request, pk=None):
          cliente = get_object_or_404(Cliente, pk=