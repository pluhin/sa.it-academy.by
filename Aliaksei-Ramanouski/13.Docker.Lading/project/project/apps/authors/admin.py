from django.contrib import admin

from .models import Author


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    # list_display = ('id', 'first_name', 'last_name')
    list_display = ('id', '__str__', 'domain', 'level')
    list_display_links = ('id', '__str__')

    def domain(self, object):
        if object.email is not None:
            return object.email.partition('@')[2]

    domain.empty_value_display = 'not entered'


# admin.site.register(Author)


