from django.contrib import admin
from . import models
# Register your models here.
@admin.register(models.UserAccount)
class UserAdmin(admin.ModelAdmin):
    list_display = ('full_name', 'email',)
    search_fields = ('full_name', 'email',)