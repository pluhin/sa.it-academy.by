from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()


@register.filter(name='domain')
@stringfilter
def domain(email):
    if '@' not in email:
        return 'email not entered'
    return email.partition('@')[2]
