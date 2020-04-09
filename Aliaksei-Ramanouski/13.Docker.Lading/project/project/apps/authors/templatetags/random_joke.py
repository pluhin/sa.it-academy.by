from random import choice
from django.utils.safestring import mark_safe
from django import template

register = template.Library()

jokes = [
    '- Как у тебя дела? - Дела как у старого танка! Дуло стоит, а воевать не с кем.',
    'Полиэтилен с пупырышками... Скажи депрессии "чпок".',
    'Водка — удивительный напиток: вкус постоянно один, а приключения всегда разные!!!',
]

@register.simple_tag
def joke(index=None):
    if index is None or not isinstance(index, int) or index >= len(jokes):
        a_joke = choice(jokes)
    else:
        a_joke = jokes[index]
    return mark_safe(f'<p>{a_joke}</p>')