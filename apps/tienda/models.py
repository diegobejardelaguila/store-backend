from django.db import models

from django.contrib.auth import get_user_model
User = get_user_model()

# Create your models here.

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cantidad = models.PositiveIntegerField()
    fecha_compra = models.DateField()
    fecha_vencimiento = models.DateField()
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre