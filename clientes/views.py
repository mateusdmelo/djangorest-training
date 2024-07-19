from rest_framework import viewsets, filters
from clientes.serializers import ClienteSerializer
from clientes.models import Cliente
from django_filters.rest_framework import DjangoFilterBackend


# viewsets.ModelViewSet - Used to create a view that allows you to perform CRUD operations.
class ClientesViewSet(viewsets.ModelViewSet):
    """Listando clientes"""
    # queryset = Cliente.objects.all() - Used to select all objects from the table.
    queryset = Cliente.objects.all() 
    # serializer_class = ClienteSerializer - transforma os dados do banco em JSON.
    serializer_class = ClienteSerializer
    filter_backends = [ DjangoFilterBackend, filters.OrderingFilter, filters.SearchFilter ]
    ordering_fields = ['nome']
    search_fields = ['nome', 'cpf']
    filterset_fields = ['ativo']
