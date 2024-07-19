from django.db import models

# A classe Cliente é um modelo que representa uma tabela no banco de dados.
# models.Model - Used to indicate that each line represents a column in the database table.
class Cliente(models.Model):
    nome = models.CharField(max_length=100)
    email = models.EmailField(blank=False, max_length=30)
    cpf = models.CharField(max_length=14, unique=True)
    rg = models.CharField(max_length=9)
    celular = models.CharField(max_length=15)
    ativo = models.BooleanField()

    # The __str__ method is used to represent the object as a string.
    def __str__(self):
        return self.nome
