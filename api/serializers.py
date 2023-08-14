from rest_framework import serializers


try:

    from apps.tienda.models import Producto

except:
    pass 

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:

        try:
            model = Producto
        except:
            pass    
        fields = '__all__'

