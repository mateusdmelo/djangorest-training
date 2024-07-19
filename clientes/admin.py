from django.contrib import admin
from clientes.models import Cliente


# admin.ModelAdmin - Used to customize the display of the model in the Django admin.
class Clientes(admin.ModelAdmin):
    list_display = ('id', 'nome', 'email', 'cpf', 'rg', 'celular', 'ativo')
    list_display_links = ('id', 'nome')
    search_fields = ('nome', 'cpf')
    list_filter = ('ativo',)
    list_editable = ('ativo',)
    list_per_page = 10
    ordering = ('nome',)

# Register the model in the Django admin.
admin.site.register(Cliente, Clientes)