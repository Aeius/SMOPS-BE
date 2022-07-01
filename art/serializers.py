from rest_framework import serializers

from art.models import Category as CategoryModel, Product
from art.models import Product as ProductModel
from art.models import Log as LogModel
from art.models import ImageShape
        
from .models import Category, Product, ImageShape, Log

##################################################################
### Main Page
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryModel
        fields = ["name"]

class ProductsMainSerializer(serializers.ModelSerializer):
    created_user = serializers.SerializerMethodField()
    def get_created_user(self, obj):
        return obj.created_user.fullname

    category = serializers.SerializerMethodField()
    def get_category(self,obj):
        return obj.category.name
    
    class Meta:
        model = Product
        fields = ["id", "category", "created_user", "img_path", "title", "description",
                  "price", "is_selling", "created_date"]

class LogsSerializer(serializers.ModelSerializer):
    product = serializers.SerializerMethodField()
    def get_product(self, obj):
        return obj.product.title

    old_owner = serializers.SerializerMethodField()
    def get_old_owner(self, obj):
        return obj.old_owner.fullname

    class Meta:
        model = Log
        fields = ['product', 'old_owner', 'updated_date', 'old_price']
