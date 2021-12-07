from django.shortcuts import render, redirect
from .models import Item
from django.core.cache import cache
import os



def home(request):
    if request.method == 'POST':
        Item.objects.create(text=request.POST['item_text'])
        return redirect('/')
    items = Item.objects.all()
    cache.get_or_set('counter', 0)
    counter = cache.incr('counter')
    return render(request, 'home.html', {'items': items, 'counter': counter})
