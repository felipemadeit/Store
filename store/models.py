from django.db import models
from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

class Category(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name

class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    price = models.IntegerField(default=0)
    brand = models.CharField(max_length=200, default="Generic")
    description = models.TextField(default="None")
    primary_img = models.ImageField(upload_to='products', default=None)
    second_img = models.ImageField(upload_to='products',default=None)
    stock = models.IntegerField(default=100)

    def get_format_price(self):
        return "${:,.0f}".format(self.price)
    
    def __str__(self):
        return self.name

class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    
    def __str__(self):
        return f'{self.quantity} of {self.product.name}'

    def get_total_price(self):
        return self.quantity * self.product.price